import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:groupmeet/group_home.dart';

class AllGroups extends StatefulWidget {
  const AllGroups({Key? key, required this.title, required this.ref})
      : super(key: key);

  final String title;
  final DatabaseReference ref;

  @override
  State<AllGroups> createState() => _AllGroupsState();
}

class _AllGroupsState extends State<AllGroups> {
  final String? uid = FirebaseAuth.instance.currentUser?.uid;

  Future<List<Map>> grabGroups() async {
    List<Map> allGroups = [];
    final snapshot = await widget.ref.child('groupIds').get();

    DatabaseReference accessGroupInfoRef =
        FirebaseDatabase.instance.ref("groups");

    if (snapshot.exists) {
      Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
      Map<dynamic, dynamic> groupInfoMap;
      for (var entry in values.entries) {
        final groupInfoSnapshot =
            await accessGroupInfoRef.child(entry.key).get();
        groupInfoMap = groupInfoSnapshot.value as Map<dynamic, dynamic>;
        groupInfoMap.putIfAbsent("gId", () => entry.key);
        allGroups.add(groupInfoMap);
      }
    }
    return allGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: grabGroups(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');

            // Never enters this else if statement
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            var groupWidget = snapshot.data!
                .map(
                  (eachGroup) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(eachGroup["gname"]),
                            Text("${eachGroup["num_members"]} Members"),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GroupHomePage(
                                      title: eachGroup["gname"],
                                      myGroup: eachGroup,
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.arrow_forward_outlined),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                .toList();

            return Column(
              children: groupWidget,
            );
          } else {
            return const Center(
              child: Text("You are not in any groups."),
            );
          }
        },
      ),
    );
  }
}
