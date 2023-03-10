import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class GroupCreation extends StatefulWidget {
  final String? groupTitle; 

  const GroupCreation({
    this.groupTitle,    
    Key? key,
    required String title,
  }) : super(key: key);

  @override
  GroupCreationState createState() => GroupCreationState();
}

class GroupCreationState extends State<GroupCreation> {
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

  Future <void> createGroupLinkUser() async {
    
    
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
    });
    final DatabaseReference usersRef = FirebaseDatabase.instance.ref("users/${FirebaseAuth.instance.currentUser!.uid}/groupIds");
    
    usersRef.update({"${groupRef.key}": true});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      
                    createGroupLinkUser()
                      .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Group Created.'),
                            duration: Duration(seconds: 5),
                          ),
                        );
                        Navigator.pop(context);
                      });
                      
                    }
                  },
                  child: const Text('Create Group'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
