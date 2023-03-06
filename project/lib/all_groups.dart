import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:groupmeet/group_home.dart';

class AllGroups extends StatefulWidget {
  const AllGroups(
      {super.key, required this.title, required this.ref});

  final String title;
  // ("users/$uid)
  final DatabaseReference ref;
  // final String? uid;

  @override
  State<AllGroups> createState() => _AllGroupsState();
}

class _AllGroupsState extends State<AllGroups> {
  final String? uid  = FirebaseAuth.instance.currentUser?.uid;
  // gets all groups associated with the current user
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
    } else {
      print("snapshot doesn't exist");
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
            if (snapshot.data != null) {
              var groupWidget = snapshot.data!
                  .map((eachGroup) => Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(children: [
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
                                            )),
                                  );                                  
                                },
                                icon: Icon(Icons.arrow_forward_outlined))
                          ])
                        ],
                      )))
                  .toList();              

              return Column(
                children: groupWidget,
              );
            } else {
              return const Text("no data yet--replace this");
            }
          }),
    );
  }
}
