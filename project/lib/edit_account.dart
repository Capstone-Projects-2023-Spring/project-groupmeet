import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditAccountInfo extends StatefulWidget {
  const EditAccountInfo({Key? key, required this.title, required this.ref}) : super(key: key);

  final String title;
  final DatabaseReference ref;

  @override
  State<EditAccountInfo> createState() => _EditAccountInfoState();
}

class _EditAccountInfoState extends State<EditAccountInfo> {
  late String fName;
  late String lName;
  late String email;
  late DatabaseReference ref;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fName = "";
    lName = "";
    email = "";
    getData();

    String temp = FirebaseAuth.instance.currentUser?.uid ?? "";
    ref = FirebaseDatabase.instance.ref("users/$temp");
  }

  void getData() async {
    DatabaseEvent event = await widget.ref.once();
    if (event.snapshot.exists) {
      setState(() {
        fName = "${event.snapshot.child("firstName").value}";
        lName = "${event.snapshot.child("lastName").value}";
        email = event.snapshot.child("email").value.toString();
      });
    }
  }

  void saveChanges() async {
    DatabaseEvent event = await widget.ref.once();
    var discord = event.snapshot.child("discord").value;
    var facebook = event.snapshot.child("facebook").value;
    var instagram = event.snapshot.child("instagram").value;
    var messages = event.snapshot.child("messages").value;
    var snapchat = event.snapshot.child("snapchat").value;
    ref.set({
      "email": _emailController.text.trim(),
      "firstName": _firstNameController.text.trim(),
      "lastName": _lastNameController.text.trim(),
      "discord": discord,
      "facebook": facebook,
      "instagram": instagram,
      "messages": messages,
      "snapchat": snapchat,
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            const Text("First Name:"),
            TextFormField(
              controller: _firstNameController..text = fName,
              decoration: InputDecoration(
                errorText: _firstNameController.text.trim().isNotEmpty ? null : "First name cannot be empty."
              ),
            ),
            const Text("Last Name:"),
            TextFormField(
              controller: _lastNameController..text = lName,
              decoration: InputDecoration(
                  errorText: _lastNameController.text.trim().isNotEmpty ? null : "Last name cannot be empty."
              ),
            ),
            const Text("Email:"),
            TextFormField(
              controller: _emailController..text = email,
              decoration: InputDecoration(
                  errorText: _emailController.text.trim().isNotEmpty ? null : "Email cannot be empty."
              ),
            ),
            ElevatedButton(
              onPressed: saveChanges,
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}