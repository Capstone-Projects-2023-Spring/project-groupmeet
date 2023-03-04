import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class AllGroups extends StatefulWidget{
  const AllGroups({super.key, required this.title, required this.uid, required this.ref});

  final String title;
  // ("users/$uid)
  final DatabaseReference ref;
  final String? uid;

  @override
  State<AllGroups> createState()=> _AllGroupsState();
} 

class _AllGroupsState extends State<AllGroups>{

  // @override
  // void initState() {
  //   super.initState();
  //   grabGroups();
  // }


  
  Future<List<String>> grabGroups() async {
  late List<String> _allGroupIds = [];  
    print("this function was called");
    final snapshot = await widget.ref.child('groupIds').get();
    if(snapshot.exists){
      // snapshot value is  the groupId object containing all the groupIds
      print(snapshot.value);
      Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
      values.forEach((key, value) {
        print("printing $key");        
      //   // setState(() {
          _allGroupIds.add(key);
      //   // });        
      });            
    }else{
     print("snapshot doesn't exist");
    }
    print("allGroupIds $_allGroupIds");
    return _allGroupIds;
    // return "randomkeytochange alter";

    }

  String? _groupId;
  Future<void> _grabGroupId() async {
        
    final snapshot = await widget.ref.child('groupId').get();
    if (snapshot.exists) {
      setState(() {
        _groupId = (snapshot.value).toString();
      });

      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }

  

  // should this only be grabbed once? maybe call this function if membesr keep joining?
  Future<void> grabGroupMembers() async {
    // grabs the object of groupIds specififc to the main user
    final snapshot = await widget.ref.child('groupIds').get();
    Map<String, List> groupAndMembers;
    if (snapshot.exists) {    
      
      DatabaseReference groupRef = FirebaseDatabase.instance.ref("groups");
      DatabaseReference findMembersRef = FirebaseDatabase.instance.ref("users");
      // **************************
      Map<dynamic, dynamic> allGroupInformation = {};
      List<String> allMembers = [];
      // **************************
      snapshot.children.forEach((eachGroupId) async {
        print(eachGroupId.key);                
        final membersSnapshot = await groupRef.child(eachGroupId.key.toString()).child("members").get();
        
        Map<dynamic, dynamic> members = membersSnapshot.value as Map<dynamic, dynamic>;
        print(members);
        members.forEach((key, value) {
          allMembers.add(key);
        });
        String gId = eachGroupId as String;
        
        // {
        //"-NPZ4fNATjGU7OpNu50K": ["Q5LPIjKwTpRA8I5TiBcFRW39I3g1", "mIzlUDN3haMMZ8Kbj79OSHCsltE3"],
        // "anotherGroupId": ["memberId1", "MemberId2"],
        // }
        // print(membersSnapshot.value.toString());   
        
      });
                
} else {
    print('No data available.');
}


  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: grabGroups(),
            builder: (context, snapshot){
              if(snapshot.data != null){
                var variable = snapshot.data!.map((eachGroupId)=> Text(eachGroupId)).toList();                
                print(snapshot.data);
                return Column(
                  children: variable,
                );
              }else{
                return Text("no data yet");
              }

            }
            )
        ]),
    );
  }
}