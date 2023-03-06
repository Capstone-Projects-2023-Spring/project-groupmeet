import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:groupmeet/group_home.dart';


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


  
  Future<List<Map>> grabGroups() async {
   
  List<String> allGroupIds = [];  
  List<Map> allGroups = [];
    print("this function was called");
    final snapshot = await widget.ref.child('groupIds').get();

    DatabaseReference accessGroupInfoRef = FirebaseDatabase.instance.ref("groups");

    if(snapshot.exists){  //make this Try and catch instead?
      // snapshot value is  the groupId object containing all the groupIds
      // print(snapshot.value);
      Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;

      Map<dynamic, dynamic> groupInfoMap;
      // for (var mapEntry in gg.entries) {
        for(var entry in values.entries){
      // values.forEach((key, value) async {
        // print("printing $key");        

          allGroupIds.add(entry.key);  
          
          print("trying to get group information below");
          final groupInfoSnapshot = await accessGroupInfoRef.child(entry.key).get();
          groupInfoMap = groupInfoSnapshot.value as Map<dynamic, dynamic>;
          // groupInfoMap.putIfAbsent("gId", () => key);
          allGroups.add(groupInfoMap);
          // print("groupInfoMap: $groupInfoMap");
          print("allGroups: $allGroups");
          

          
      }
      // );            
    }else{
     print("snapshot doesn't exist");
    }
    // print("allGroupIds $_allGroupIds");
    print("all groups at the end: $allGroups" );
    return allGroups;
    

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
        // print(eachGroupId.key);                
        final membersSnapshot = await groupRef.child(eachGroupId.key.toString()).child("members").get();
        
        Map<dynamic, dynamic> members = membersSnapshot.value as Map<dynamic, dynamic>;
        print(members);
        members.forEach((key, value) {
          allMembers.add(key);
        });
        String gId = eachGroupId as String;
        
       
        
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
      body: 
      FutureBuilder(
        future: grabGroups(),
        builder: (context, snapshot){
          if(snapshot.data != null){                
            var variable = snapshot.data!.map((eachGroup)=> 
          Container(  
            decoration: BoxDecoration(border: Border.all(
      width: 2,
    ),),
            child :
            Row(   
              mainAxisAlignment: MainAxisAlignment.center,
              children:[              
                Column(
                children: [
                Text(eachGroup["gname"]),
                Text(eachGroup["num_members"].toString() + " Members"),
                IconButton(onPressed: (){
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                GroupHomePage(title: eachGroup["gname"])),
                      );
                  
                  // go to the group home page & put in the variables that group Home page would be taking in
                }, icon: Icon(Icons.arrow_forward_outlined))
                
               ] ) ],
            ))).toList() ;
            // ); 

            return Column(
              children: variable,
            );
          }else{
            return Text("no data yet");
          }

        }
        ),
    );
  }
}