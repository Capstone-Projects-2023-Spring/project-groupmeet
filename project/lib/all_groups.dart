import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:groupmeet/group_creation.dart';
import 'package:groupmeet/group_home.dart';
import 'package:groupmeet/user_addtion.dart';

class AllGroups extends StatefulWidget {
  const AllGroups({Key? key, required this.title, required this.ref})
      : super(key: key);

  final String title;
  final DatabaseReference ref;

  @override
  State<AllGroups> createState() => _AllGroupsState();
}

class _AllGroupsState extends State<AllGroups> {
  late TextEditingController group_id;
  late DatabaseReference ref = widget.ref;
  final String? uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    super.initState();
    group_id = TextEditingController();
  }

  @override
  void dispose() {
    group_id.dispose();
    super.dispose();
  }

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

  Future openDialog() =>
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text('Enter Group Code Below'),
                content: TextField(
                  autofocus: true,
                  decoration: InputDecoration(hintText: 'Enter here......'),
                  controller: group_id,
                ),
                actions: [
                  TextButton(
                      onPressed: join_group, child: Text('Join'))
                ],

              ));

  void join_group(){
    add_user().groupid = group_id as String;
    add_user();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions:[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(child: Row(children: [
                  TextButton(
                    onPressed: openDialog,
                    child: Text('Join Group Via Code'),)
                ],),),
                PopupMenuItem(child: Row(children: [
                  Text('Join Group Via QR Scan'),
                ],))
              ],
            ),
          )
        ]
      ),
      body: Column(children: [FutureBuilder(
        future: grabGroups(),
        builder: (context, snapshot) {          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } 
          else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');            
          } 
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
                            Text(eachGroup["name"]),
                            Text("${eachGroup["numMembers"]} Members"),
                            IconButton(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GroupHomePage(
                                      title: eachGroup["name"],
                                      databaseReference: ref,
                                      myGroup: eachGroup,
                                    ),
                                  ),
                                );
                                setState(() {});
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Create new group"),
            IconButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const GroupCreation(title: "Group Creation")),
                  );
                  setState(() {});                  
                },
                icon: const Icon(Icons.add))
          ],
        )
      ]),
    );
  }
}
