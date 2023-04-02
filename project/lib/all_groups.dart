import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/group_creation.dart';
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
  late DatabaseReference ref = widget.ref;
  final String? uid = FirebaseAuth.instance.currentUser?.uid;

  Future<List<Map>> grabGroups() async {
    List<Map> allGroups = [];
    print(allGroups);
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
      body: Column(children: [
        FutureBuilder(
          future: grabGroups(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: PlatformCircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return PlatformText('Error: ${snapshot.error}');
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
                              PlatformText(eachGroup["name"]),
                              PlatformText(
                                  "${eachGroup["numMembers"]} Members"),
                              PlatformIconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    platformPageRoute(
                                      context: context,
                                      builder: (context) => GroupHomePage(
                                        title: eachGroup["name"],
                                        databaseReference: ref,
                                        myGroup: eachGroup,
                                      ),
                                    ),
                                  );
                                  setState(() {});
                                },
                                icon: Icon(PlatformIcons(context).rightChevron),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlatformText("Create new group"),
            PlatformIconButton(
                onPressed: () async {
                  await Navigator.of(context).push(
                    platformPageRoute(
                        context: context,
                        builder: (context) =>
                            const GroupCreation(title: "Group Creation")),
                  );
                  setState(() {});
                },
                icon: Icon(PlatformIcons(context).add))
          ],
        )
      ]),
    );
  }
}
