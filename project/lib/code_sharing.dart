import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class CodeSharing extends StatefulWidget {
  const CodeSharing({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CodeSharing> createState() => _CodeSharingState();
}

Future<DataSnapshot> _grabGroupId() async {
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");
  final snapshot = await ref.child('groupId').get();
  return snapshot;
}

class _CodeSharingState extends State<CodeSharing> {
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
            FutureBuilder<DataSnapshot>(
              future: _grabGroupId(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (!snapshot.hasData) {
                  return const Text('No data available');
                }
                String? groupId = snapshot.data!.value.toString();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Join Group: $groupId"),
                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Join Group Button'),
                            duration: Duration(seconds: 5),
                          ),
                        );
                      },
                      icon: const Icon(size: 30, Icons.content_copy_rounded),
                    ),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Link Here"),
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Link Here Button'),
                        duration: Duration(seconds: 5),
                      ),
                    );
                  },
                  icon: const Icon(size: 30, Icons.content_copy_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
