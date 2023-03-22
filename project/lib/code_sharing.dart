import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

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
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(size: 30, PlatformIcons(context).shareSolid),
            FutureBuilder<DataSnapshot>(
              future: _grabGroupId(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return PlatformCircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return PlatformText('Error: ${snapshot.error}');
                }
                if (!snapshot.hasData) {
                  return PlatformText('No data available');
                }
                String? groupId = snapshot.data!.value.toString();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlatformText("Join Group: $groupId"),
                    PlatformIconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: PlatformText('Join Group Button'),
                            duration: Duration(seconds: 5),
                          ),
                        );
                      },
                      icon: Icon(size: 30, PlatformIcons(context).share),
                    ),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlatformText("Link Here"),
                PlatformIconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Link Here Button'),
                        duration: Duration(seconds: 5),
                      ),
                    );
                  },
                  icon: Icon(size: 30, PlatformIcons(context).share),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
