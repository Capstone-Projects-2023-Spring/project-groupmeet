import 'package:flutter/material.dart';
import 'package:groupmeet/code_sharing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'account_info.dart';
import 'group_creation.dart';
import 'code_reception.dart';
import 'group_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DatabaseReference ref;
  String? uid;

  @override
  void initState() {
    super.initState();
    ref = FirebaseDatabase.instance.ref();
  }

  Future<void> logout() async {
    print("logging out");
    await FirebaseAuth.instance.signOut();
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
          const Image(
            image: NetworkImage(
                "https://cdn.pixabay.com/photo/2016/09/09/23/27/the-ostrich-1658267_960_720.jpg"),
          ),
          Column(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    logout();
                  },
                  child: const Text("Logout")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text("Group creation"),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GroupCreation(
                            title: "Group Creation",
                            databaseReference: ref,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.create),
                  ),
                ],
              ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text("Main Group Page (TEMPORARY BUTTON)"),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const GroupHomePage(title: "Main Group Page")),
                      );
                    },
                    icon: const Icon(Icons.cabin),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
