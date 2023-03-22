import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';


import 'calendar.dart';

// change to commented out after groupHome is no longer accessible from main.dart (my group is not available in main.dart)
class GroupHomePage extends StatefulWidget {
  // const GroupHomePage({super.key, required this.title, required this.myGroup});
  const GroupHomePage(
      {super.key,
      required this.title,
      required this.databaseReference,
      this.myGroup});

  final String title;
  final DatabaseReference databaseReference;
  final Map<dynamic, dynamic>? myGroup;

  @override
  State<GroupHomePage> createState() => _GroupHomePageState();
}

class _GroupHomePageState extends State<GroupHomePage> {
  late DatabaseReference databaseReference;
  late int instaCount;
  late int fbCount;
  late int discordCount;
  late int messagesCount;
  late int snapCount;

  Future<List<Map<dynamic, dynamic>>> grabGroupMembers() async {
    List<Map> allMembers = [];
    DatabaseReference ref = FirebaseDatabase.instance.ref("users");

    Map<dynamic, dynamic> allMembersMap;

    for (var memberId in widget.myGroup!["members"].entries) {
      final memberSnapshot = await ref.child(memberId.key).get();
      allMembersMap = memberSnapshot.value as Map<dynamic, dynamic>;
      allMembersMap.putIfAbsent("uid", () => memberId.key);
      allMembers.add(allMembersMap);
    }

    return allMembers;
  }

  Future<void> leaveGroup() async {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    DatabaseReference userRef = FirebaseDatabase.instance
        .ref("users/$uid/groupIds/${widget.myGroup!["gId"]}");
    DatabaseReference groupRef =
        FirebaseDatabase.instance.ref("groups/${widget.myGroup!["gId"]}");

    userRef.remove();
    groupRef.remove();
  }

  @override
  void initState() {
    super.initState();
    instaCount = 0;
    fbCount = 0;
    discordCount = 0;
    messagesCount = 0;
    snapCount = 0;
    // getData();

  }

  Future<Map<String, int>> getData() async {
    List<Map> allMembers = [];
    DatabaseReference ref = FirebaseDatabase.instance.ref("users");

    Map<dynamic, dynamic> allMembersMap;

    for (var memberId in widget.myGroup!["members"].entries) {
      final memberSnapshot = await ref.child(memberId.key).get();
      allMembersMap = memberSnapshot.value as Map<dynamic, dynamic>;
      allMembersMap.putIfAbsent("uid", () => memberId.key);
      allMembers.add(allMembersMap);
    }

    for (var element in allMembers) {
      if (element["instagram"].toString() == "true") {
        instaCount += 1;
      }
      if (element["facebook"].toString() == "true") {
        fbCount++;
      }
      if (element["discord"].toString() == "true") {
        discordCount++;
      }
      if (element["messages"].toString() == "true") {
        messagesCount++;
      }
      if (element["snapchat"].toString() == "true") {
        snapCount++;
      }
    }
    Map<String, int> socialMediaMap = {
      "instagram": instaCount,
      "facebook": fbCount,
      "discord": discordCount,
      "messages": messagesCount,
      "snapchat": snapCount
    };
    // Need to have this update to database in the future
    widget.myGroup
        ?.update("instaCount", (value) => 'New', ifAbsent: () => instaCount);
    widget.myGroup
        ?.update("fbCount", (value) => 'New', ifAbsent: () => fbCount);
    widget.myGroup?.update("discordCount", (value) => 'New',
        ifAbsent: () => discordCount);
    widget.myGroup?.update("messagesCount", (value) => 'New',
        ifAbsent: () => messagesCount);
    widget.myGroup
        ?.update("snapCount", (value) => 'New', ifAbsent: () => snapCount);

    // print(widget.myGroup);
    // print(widget.myGroup!['instaCount'].toString());
    // print(allMembers);
    // print(instaCount);
    // print(fbCount);
    // print(discordCount);
    // print(messagesCount);
    // print(snapCount);

    return socialMediaMap;
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
              Text.rich(
                TextSpan(
                  text: widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
              // const Image(
              //   image: NetworkImage(
              //       // TEMPORARY IMAGE, SHOW STATIC CALENDAR HERE
              //       "https://cdn.discordapp.com/attachments/979937535272816703/1079918387339206886/image.png"),
              //   width: 400,
              //   height: 200,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {                       
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => const CalendarPage(
                            title: "Calendar",
                          )));
                        },
                        child: const Text('pulling google events',
                            style: TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Test'),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        },
                        child: const Text('Edit Availabilities',
                            style: TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Test'),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        },
                        child: PlatformText('Suggest New Meeting Time',
                            style: const TextStyle(fontSize: 25)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Test'),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        },
                        child: PlatformText('Cancel Active Meeting',
                            style: const TextStyle(fontSize: 25)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(
                      future: grabGroupMembers(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var membersWidget = snapshot.data!
                              .map((eachMember) => Text(
                                    eachMember["firstName"] +
                                        " " +
                                        eachMember["lastName"],
                                    style: const TextStyle(fontSize: 15),
                                  ))
                              .toList();
                          var check = Column(
                            children: membersWidget,
                          );
                          return Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey)),
                              child: Column(children: [
                                PlatformText(
                                    style: const TextStyle(fontSize: 20), "Members"),
                                check
                              ]));
                        } else {
                          return PlatformText("no data yet--replace this");
                        }
                      })
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Test'),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        },
                        child: const Text('Edit Members'),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {
                          leaveGroup().then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Left Group ${widget.myGroup!["name"]}'),
                                duration: const Duration(seconds: 5),
                              ),
                            );
                            Navigator.pop(context);
                          });
                        },
                        child: PlatformText('Leave Group'),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(
                      future: getData(),
                      builder: (context, snapshot) {
                        List<Text> socialMediaText = [];
                        if (snapshot.hasData) {
                          snapshot.data!.forEach((key, value) {
                            socialMediaText.add(Text("$key $value"));
                          });
                        }
                        var check = Column(children: socialMediaText);
                        return Container(
                          child: check,
                        );
                      }),
                  // FutureBuilder(
                  //     future: grabGroupMembers(),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasData) {
                  //         var membersWidget = snapshot.data!
                  //             .map((test) => Text(
                  //           "Instagram Users: " + instaCount.toString() + " "
                  //           + "Facebook Users: " + fbCount.toString() + " "
                  //           + "Discord Users: " + discordCount.toString() + " "
                  //           + "Messages Users: " + messagesCount.toString() + " "
                  //           + "Snapchat Users: " + snapCount.toString() + " ",
                  //           style: const TextStyle(fontSize: 15),
                  //         ))
                  //             .toList();
                  //         var check = Column(
                  //           children: membersWidget,
                  //         );
                  //         return Container(
                  //             decoration: BoxDecoration(
                  //                 border:
                  //                 Border.all(width: 1, color: Colors.grey)),
                  //             child: Column(children: [
                  //               const Text(
                  //                   style: TextStyle(fontSize: 20), "Social Media Platforms"),
                  //               check
                  //             ]));
                  //       } else {
                  //         return const Text("no data yet--replace this");
                  //       }
                  //     })

                  // FutureBuilder(
                  //     future: grabGroupMembers(),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasData) {
                  //         var membersWidget = snapshot.data!.map((test) => Text(
                  //           "Instagram Users: " + instaCount.toString() + " "
                  //               + "Facebook Users: " + fbCount.toString() + " "
                  //               + "Discord Users: " + discordCount.toString() + " "
                  //               + "Messages Users: " + messagesCount.toString() + " "
                  //               + "Snapchat Users: " + snapCount.toString() + " ",
                  //           style: const TextStyle(fontSize: 15),
                  //         ))
                  //             .toList();
                  //         var check = Column(
                  //           children: membersWidget,
                  //         );
                  //         return Container(
                  //             decoration: BoxDecoration(
                  //                 border:
                  //                 Border.all(width: 1, color: Colors.grey)),
                  //             child: Column(children: [
                  //               const Text(
                  //                   style: TextStyle(fontSize: 20), "Social Media Platforms"),
                  //               check
                  //             ]));
                  //       } else {
                  //         return const Text("no data yet--replace this");
                  //       }
                  //     })

                  // Column(
                  //   children: [
                  //     Text(
                  //         style: const TextStyle(fontSize: 20),
                  //         "Instagram Users: $instaCount",
                  //     ),
                  //     Text(
                  //       style: const TextStyle(fontSize: 20),
                  //       "Facebook Users: $fbCount",
                  //     ),
                  //     Text(
                  //       style: const TextStyle(fontSize: 20),
                  //       "Discord Users: $discordCount",
                  //     ),
                  //     Text(
                  //       style: const TextStyle(fontSize: 20),
                  //       "Messages Users: $messagesCount",
                  //     ),
                  //     Text(
                  //       style: const TextStyle(fontSize: 20),
                  //       "Snapchat Users: $snapCount",
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
