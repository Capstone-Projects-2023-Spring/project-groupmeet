import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class CodeSharing extends StatefulWidget {
  const CodeSharing({super.key, required this.title});

  final String title;

  @override
  State<CodeSharing> createState() => _CodeSharingState();
}

class _CodeSharingState extends State<CodeSharing> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

// grab all user information when they are logged in instead of making multiple calls?
  @override
  void initState() {
    super.initState();
    _grabGroupId();
  }

  String? _groupId;
  Future<void> _grabGroupId() async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");
    final snapshot = await ref.child('groupId').get();
    if (snapshot.exists) {
      setState(() {
        _groupId = (snapshot.value).toString();
      });

      print(snapshot.value);
    } else {
      print('No data available.');
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(size: 250, Icons.qr_code_2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Join Group: $_groupId"),
                IconButton(
                    onPressed: () {
                      print("doing nothing1");
                    },
                    icon: const Icon(size: 30, Icons.content_copy_rounded))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Link Here"),
                IconButton(
                    onPressed: () {
                      print("doing nothing2");
                    },
                    icon: const Icon(size: 30, Icons.content_copy_rounded))
              ],
            )
          ],
        ),
      ),
    );
  }
}
// Page that displays QR code link, random code, and copy link button



