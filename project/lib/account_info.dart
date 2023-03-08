import 'package:flutter/material.dart';
import 'socials.dart';
import 'package:firebase_database/firebase_database.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({Key? key, required this.title, required this.ref}) : super(key: key);

  final String title;
  final DatabaseReference ref;

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  late String name;
  late String email;

  @override
  void initState() {
    super.initState();
    name = "";
    email = "";
    getData();
  }

  void getData() async {
    DatabaseEvent event = await widget.ref.once();
    if (event.snapshot.exists) {
      setState(() {
        name = "${event.snapshot.child("firstName").value} ${event.snapshot.child("lastName").value}";
        email = event.snapshot.child("email").value.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    builder: (context) => const SocialMedia(title: "Social Media"),
                  ),
                );
              },
              icon: const Icon(Icons.create),
            ),
            Column(
              children: [
                const Text("Name:"),
                Text(name),
              ],
            ),
            Column(
              children: [
                const Text("Email:"),
                Text(email),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
