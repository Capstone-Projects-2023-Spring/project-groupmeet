import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
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
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(widget.title),
      ),
      body: FutureBuilder(
        future: grabGroups(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: PlatformCircularProgressIndicator(),
            );
          } 
          // else if (snapshot.hasError) {
          //   return Text('Error: ${snapshot.error}');

          //   // Never enters this else if statement
          // } 
          else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
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
                            PlatformText(eachGroup["name"]),
                            PlatformText("${eachGroup["numMembers"]} Members"),
                            PlatformIconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  platformPageRoute(
                                    context: context,
                                    builder: (context) => GroupHomePage(
                                      title: eachGroup["name"],
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
            return Center(
              child: PlatformText("You are not in any groups."),
            );
          }
        },
      ),
    );
  }
}
