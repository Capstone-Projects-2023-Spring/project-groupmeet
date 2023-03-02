import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class GroupCreation extends StatefulWidget {
// <<<<<<< tyler
  final String? groupTitle;
  final DatabaseReference databaseReference;

  const GroupCreation({
    this.groupTitle,
    required this.databaseReference,
    Key? key,
    required String title,
  }) : super(key: key);
// =======
//   const GroupCreation({super.key});

//   // final String title;

  
// >>>>>>> main

  @override
  _GroupCreationState createState() => _GroupCreationState();
}

class _GroupCreationState extends State<GroupCreation> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _numMembersController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.groupTitle != null) {
      _groupNameController.text = widget.groupTitle!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// <<<<<<< tyler
      appBar: AppBar(
        title: const Text('Create a Group'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Group Name', hintText: 'Enter group name'),
                  controller: _groupNameController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Number of Members',
                      hintText: 'Enter number of members'),
                  controller: _numMembersController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    final int? numMembers = int.tryParse(value);
                    if (numMembers == null || numMembers < 2) {
                      return 'Please enter a valid number of members (minimum 2)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Save the group data to the database
                      final DatabaseReference groupRef = FirebaseDatabase
                          .instance
                          .ref()
                          .child('groups')
                          .push();
                      groupRef.set({
                        'name': _groupNameController.text,
                        'numMembers': int.parse(_numMembersController.text),
                        'admin': FirebaseAuth.instance.currentUser!.uid,
                        'members': {
                          FirebaseAuth.instance.currentUser!.uid: true
                        },
                      }).then((_) {
                        Navigator.pop(context);
                      });
                    }
                  },
                  child: const Text('Create Group'),
                ),
              ],
            ),
          ),
          
// =======
//       // remove from below when background color is added to themeData in main
//       backgroundColor: Colors.black,      
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [            
//               const Icon(              
//               Icons.add_circle_outlined,
//               color: Colors.grey,
//               size: 175,
//               shadows: [Shadow(color: Colors.grey, blurRadius: 20.0)],
//             ),      
//             const Text(
//               "Get Around!",
//               style: TextStyle(
//                   fontSize: 37,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//             SizedBox(height: 50),
//             Container(
//               width: 325,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Color.fromRGBO(81, 59, 219, 1),
//                     blurRadius: 4,
//                     offset: Offset(2, 3), // Shadow position
//                   ),
//                 ],
//               ),
//               child: TextField(
//                 controller: _gnameController,
//                 keyboardType: TextInputType.name,
//                 decoration: const InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey,
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                       Radius.circular(30.0),
//                     )),
//                     labelText: "Group Name",
//                     labelStyle: TextStyle(color: Colors.white)),
//               ),
//             ),
//             SizedBox(height: 25),
//             Container(
//               width: 325,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Color.fromRGBO(81, 59, 219, 1),
//                     blurRadius: 4,
//                     offset: Offset(2, 3), // Shadow position
//                   ),
//                 ],
//               ),
//               child: TextField(
//                   controller: _gnumController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey,
//                       border: OutlineInputBorder(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(30.0))),
//                       labelText: "Number of Members",
//                       labelStyle: TextStyle(color: Colors.white))),
//             ),
//             SizedBox(height: 100),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   width: 2,
//                   color: Color.fromRGBO(81, 59, 219, 1),
//                 ),
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//               ),
//               child: IconButton(
//                 iconSize: 50,
//                 icon: const Icon(
//                   Icons.arrow_forward_rounded,
//                   color: Colors.black,
//                 ),
//                 onPressed: () {
//                   print('Hi There');
//                 },
//               ),
//             )        
//           ],
// >>>>>>> main
        ),
      ),
    );
  }
}
