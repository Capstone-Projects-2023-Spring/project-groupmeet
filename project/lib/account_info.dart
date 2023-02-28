import 'package:flutter/material.dart';
import 'socials.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key, required this.title, required this.ref});

  final String title;
  final DatabaseReference ref;

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  String name = "";
  String email = "";
  void GetData()async{
    DatabaseEvent event = await widget.ref.once();
    if(event.snapshot.exists) {
      name = event.snapshot
          .child("firstName")
          .value.toString() + " " + event.snapshot
          .child("lastName")
          .value.toString();

      email = event.snapshot.child("email").value.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    GetData();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Edit Social Media Accounts"),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const SocialMedia(title: "Social Media")),
                );
              },
              icon: const Icon(Icons.create),
            ),
            Container(
              child: Column(
                  children: [
                    Text("Name:"),
                    Text(name),
                  ]
              ),
            ),
            Container(
              child: Column(
                  children: [
                    Text("Email:"),
                    Text(email),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
