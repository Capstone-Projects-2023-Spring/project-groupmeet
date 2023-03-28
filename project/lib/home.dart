import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/code_sharing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:groupmeet/group_creation2.dart';

import 'account_info.dart';
import 'group_creation.dart';
import 'code_reception.dart';
import 'all_groups.dart';
import 'add_event.dart';

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
    debugPrint("HomeScreen: $temp");
    notification();
  }

  Future<void> notification() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    ref.child("fcmToken").set(fcmToken);
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
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              PlatformElevatedButton(
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
                  PlatformText("My Account"),
                  PlatformIconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        platformPageRoute(
                            context: context,
                            builder: (context) =>
                                AccountInfo(title: "My Account", ref: ref)),
                      );
                    },
                    icon: Icon(PlatformIcons(context).create,
                        color: Colors.white),
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
                  PlatformText("Group creation"),
                  PlatformIconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        platformPageRoute(
                            context: context,
                            builder: (context) =>
                                const GroupCreation(title: "Group Creation")),
                      );
                    },
                    icon: Icon(
                      PlatformIcons(context).create,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlatformText("Join a Group"),
                  PlatformIconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        platformPageRoute(
                            context: context,
                            builder: (context) =>
                                const CodeReception(title: "Join a Group")),
                      );
                    },
                    icon: Icon(PlatformIcons(context).create,
                        color: Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlatformText("Code Sharing Page"),
                  PlatformIconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        platformPageRoute(
                            context: context,
                            builder: (context) =>
                                const CodeSharing(title: "Code Sharing")),
                      );
                    },
                    icon: Icon(PlatformIcons(context).photoCamera,
                        color: Colors.white),
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
                  PlatformText("All Groups"),
                  PlatformIconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          platformPageRoute(
                              context: context,
                              builder: (context) => AllGroups(
                                  title: "Display All Groups Here",
                                  // uid: uid,
                                  ref: ref)),
                        );
                      },
                      icon: Icon(
                        PlatformIcons(context).group,
                        color: Colors.white,
                      ))
                ],
              )
            ],
          ),
          Column(
            children: [
              PlatformText("Group Creation 2"),
              PlatformIconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    platformPageRoute(
                      context: context,
                      builder: (context) => GroupCreation2(
                          title: "Group Creation 2", databaseReference: ref),
                    ),
                  );
                },
                icon: Icon(PlatformIcons(context).create, color: Colors.white),
              ),
            ],
          ),
          Column(
            children: [
              PlatformText("Add Event"),
              PlatformIconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    platformPageRoute(
                      context: context,
                      builder: (context) => AddEvent(
                        title: "Add New Event", ref: ref),
                    ),
                  );
                },
                icon: Icon(PlatformIcons(context).add, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
