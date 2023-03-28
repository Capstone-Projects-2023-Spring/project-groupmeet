import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

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
    var groups = event.snapshot.child("groupIds").value;
    ref.set({
      "email": _emailController.text.trim(),
      "firstName": _firstNameController.text.trim(),
      "lastName": _lastNameController.text.trim(),
      "discord": discord,
      "facebook": facebook,
      "instagram": instagram,
      "messages": messages,
      "snapchat": snapchat,
      "groupIds": groups,
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            PlatformText("First Name:"),
            PlatformTextFormField(
              controller: _firstNameController..text = fName,
            ),
            PlatformText("Last Name:"),
            PlatformTextFormField(
              controller: _lastNameController..text = lName,
            ),
            const Text("Email:"),
            PlatformTextFormField(
              controller: _emailController..text = email,
            ),
            PlatformElevatedButton(
              onPressed: saveChanges,
              child: PlatformText("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}