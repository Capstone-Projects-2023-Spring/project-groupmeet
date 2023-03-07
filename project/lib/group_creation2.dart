import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class GroupCreation2 extends StatefulWidget {
  final String? groupTitle;
  final DatabaseReference databaseReference;

  const GroupCreation2({
    this.groupTitle,
    required this.databaseReference,
    Key? key,
    required String title,
  }) : super(key: key);

  @override
  _GroupCreationState createState() => _GroupCreationState();
}

class _GroupCreationState extends State<GroupCreation2> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _numMembersController = TextEditingController();

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
      appBar: AppBar(
        title: const Text('Create a Group 2'),
      ),
      // remove from below when background color is added to themeData in main
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add_circle_outlined,
            color: Colors.grey,
            size: 175,
            shadows: [Shadow(color: Colors.grey, blurRadius: 20.0)],
          ),
          const Text(
            "Get Around!",
            style: TextStyle(
                fontSize: 37, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 50),
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
              controller: _groupNameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  )),
                  labelText: "Group Name",
                  labelStyle: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 25),
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
                controller: _numMembersController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: "Number of Members",
                    labelStyle: TextStyle(color: Colors.white))),
          ),
          const SizedBox(height: 100),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: const Color.fromRGBO(81, 59, 219, 1),
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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Hi There'),
                    duration: Duration(seconds: 5),
                  ),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
