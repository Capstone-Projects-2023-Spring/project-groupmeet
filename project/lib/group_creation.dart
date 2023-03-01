import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class GroupCreation extends StatefulWidget {
  const GroupCreation({super.key});

  // final String title;

  @override
  State<GroupCreation> createState() => _CodeSharingState();
}

class _CodeSharingState extends State<GroupCreation> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  final _gnameController = TextEditingController();
  final _gnumController = TextEditingController();

  // Method to create a new group in the database and add the current user as a member
  Future<void> createGroup() async {
    String? uid;

    // Get the current user's ID and return early if the user is not logged in
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      uid = user.uid;
    } else {
      print("User is not logged in");
      return;
    }

    // Retrieves the values from the text fields and validate them
    final gname = _gnameController.text.trim();
    final gnumStr = _gnumController.text.trim();

    // Return early if group name is empty
    if (gname.isEmpty) {
      print("gname empty");
      return;
    }

    // Return early if number of members is empty
    if (gnumStr.isEmpty) {
      print("gnum empty");
      return;
    }

    // Return early if number of members is not a valid integer
    final gnum = int.tryParse(gnumStr);
    if (gnum == null) {
      print("gnum is not a number");
      return;
    }

    // Create a new group node in the database
    final groupRef = FirebaseDatabase.instance.ref().child('groups').push();
    await groupRef.set({
      'gname': gname,
      'num_members': gnum,
      'creator_id': uid,
    });

    // Add the current user to the group's member list
    final memberRef = groupRef.child('members').push();
    await memberRef.set(uid);
    print("Member Added");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              // change this, the cross is too big in the circle
              Icons.add_circle_outlined,
              color: Colors.grey,
              size: 175,
            ),
            const Text(
              "Get Around!",
              style: TextStyle(
                  fontSize: 37,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 50),
            Container(
              width: 325,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(81, 59, 219, 1),
                    blurRadius: 4,
                    offset: Offset(2, 3), // Shadow position
                  ),
                ],
              ),
              child: TextField(
                controller: _gnameController,
                keyboardType: TextInputType.name,

                // BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    // enabledBorder:
                    // UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    )),
                    labelText: "Group Name",
                    labelStyle: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: 325,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(81, 59, 219, 1),
                    blurRadius: 4,
                    offset: Offset(2, 3), // Shadow position
                  ),
                ],
              ),
              child: TextField(
                  controller: _gnumController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      labelText: "Number of Members",
                      labelStyle: TextStyle(color: Colors.white))),
            ),
            // DELETE
            // how to put the color border around the icon using a container
            // https://www.kindacode.com/snippet/flutter-adding-a-border-to-an-icon-button/
            SizedBox(height: 100),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Color.fromRGBO(81, 59, 219, 1),
                ),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                iconSize: 50,
                icon: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  print('Hi There');
                },
              ),
            )

            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(50),
            //       //border radius equal to or more than 50% of width
            //     )),
            //     onPressed: () {
            //       createGroup();
            //     },
            //     child: const Text("Create Group")),
          ],
        ),
      ),
    );
  }
}
