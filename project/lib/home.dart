import 'package:flutter/material.dart';
import 'package:groupmeet/code_sharing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:groupmeet/group_creation2.dart';

import 'account_info.dart';
import 'group_creation.dart';
import 'code_reception.dart';
import 'all_groups.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

@visibleForTesting
class HomeScreenState extends State<HomeScreen> {
  late DatabaseReference ref;

  @override
  void initState() {
    super.initState();
    String temp = FirebaseAuth.instance.currentUser?.uid ?? "";
    ref = FirebaseDatabase.instance.ref("users/$temp");
  }

  Future<void> logout(NavigatorState navigatorState,
      ScaffoldMessengerState scaffoldMessengerState) async {
    try {
      await FirebaseAuth.instance.signOut();
      scaffoldMessengerState.showSnackBar(
        const SnackBar(
          content: Text('Logged out successfully.'),
          duration: Duration(seconds: 5),
        ),
      );
      navigatorState.pop();
    } catch (e) {
      scaffoldMessengerState.showSnackBar(
        SnackBar(
          content: Text('An error occurred while logging out: $e'),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    logout(
                        Navigator.of(context), ScaffoldMessenger.of(context));
                  },
                  child: const Text("Logout")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text("My Account"),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AccountInfo(title: "My Account", ref: ref)),
                      );
                    },
                    icon: const Icon(Icons.create),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text("Group creation"),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GroupCreation(
                                title: "Group Creation",
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.create),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text("Join a Group"),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CodeReception(title: "Join a Group")),
                          );
                        },
                        icon: const Icon(Icons.create),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text("Code Sharing Page"),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CodeSharing(title: "Code Sharing")),
                          );
                        },
                        icon: const Icon(Icons.qr_code),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text("All Groups"),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllGroups(
                                    title: "Display All Groups Here",
                                    // uid: uid,
                                    ref: ref)));
                      },
                      icon: const Icon(Icons.group))
                ],
              )
            ],
          ),
          // Column(
          //   children: [
          //     const Text("Group Creation 2"),
          //     IconButton(
          //       onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => GroupCreation2(
          //                   title: "Group Creation 2", databaseReference: ref)),
          //         );
          //       },
          //       icon: const Icon(Icons.create),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
