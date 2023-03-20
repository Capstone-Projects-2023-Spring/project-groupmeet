import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

// change to commented out after groupHome is no longer accessible from main.dart (my group is not available in main.dart)
class GroupHomePage extends StatefulWidget {
  // const GroupHomePage({super.key, required this.title, required this.myGroup});
  const GroupHomePage({super.key, required this.title, this.myGroup});

  final String title;
  final Map<dynamic, dynamic>? myGroup;

  @override
  State<GroupHomePage> createState() => _GroupHomePageState();
}

class _GroupHomePageState extends State<GroupHomePage> {
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
    // print(allMembers);
    return allMembers;
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
              const Image(
                image: NetworkImage(
                    // TEMPORARY IMAGE, SHOW STATIC CALENDAR HERE
                    "https://cdn.discordapp.com/attachments/979937535272816703/1079918387339206886/image.png"),
                width: 400,
                height: 200,
              ),
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Test'),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        },
                        child: const Text('View Calendar',
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Test'),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        },
                        child: PlatformText('Leave Group'),
                      ),
                    ],
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
