import 'package:flutter/material.dart';
import 'socials.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key, required this.title});

  final String title;

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
            Text("Edit Social Media Accounts"),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SocialMedia(
                          title: "Social Media")),
                );
              },
              icon: Icon(Icons.create),
            ),
          ],
        ),
      ),
    );
  }
}