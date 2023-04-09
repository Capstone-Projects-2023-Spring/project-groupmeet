import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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
    List<Map>? allMembers = [];
    DatabaseReference ref = FirebaseDatabase.instance.ref("users");

    Map<dynamic, dynamic> allMembersMap;

    for (var memberId in widget.myGroup!["members"].entries) {
      final memberSnapshot = await ref.child(memberId.key).get();
      allMembersMap = memberSnapshot.value as Map<dynamic, dynamic>;
      allMembersMap.putIfAbsent("uid", () => memberId.key);
      allMembers.add(allMembersMap);
    }
    //print(allMembers);
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
  }

  Future<Map<String, int>> getData() async {
    instaCount = 0;
    fbCount = 0;
    discordCount = 0;
    messagesCount = 0;
    snapCount = 0;

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
      "Instagram": instaCount,
      "Facebook": fbCount,
      "Discord": discordCount,
      "Messages": messagesCount,
      "Snapchat": snapCount
    };
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

    return socialMediaMap;
  }

  Future<List<Appointment>> getEventList() async{
    List<Appointment> allEvents = [];
    DatabaseReference ref = await FirebaseDatabase.instance.ref("users");

    Map<dynamic, dynamic> allMemberEvents;

    for (var memberId in widget.myGroup!["members"].entries) {
      print(memberId);
      final memberSnapshot = await ref.child(memberId.key+"/calendarEvents").get();
      if(memberSnapshot.value == null) continue;
      for (var event in memberSnapshot.value as List){
        var tempStart;
        var tempEnd;
        event[0] == "null" ? tempStart = event[1] : tempStart = event[0];
        event[2] == "null" ? tempEnd = event[3] : tempEnd = event[2];

        allEvents.add(Appointment(startTime: DateTime.parse(tempStart), endTime: DateTime.parse(tempEnd)));
      }
    }    
    
    return allEvents as List<Appointment>;
  }

    // call getData from this function and then use the array of events to find the next best date
  Future<List<DateTime>> findNextBestDate() async {
    List<Appointment> allEvents = await getEventList() ;    
    List<DateTime> daysToPropose = [];
    // order events by the date        
    allEvents.sort((a, b) => a.startTime.compareTo(b.startTime),);  
          
      // if tomorrow is not within planned events than you can propose a meeting on that day
      // try to get 5 and then quit
      // if the proposing time is at midnight it's because the whole day is free
      DateTime toMeet = DateTime.now().add(const Duration(days:1));
      toMeet = DateTime(toMeet.year, toMeet.month, toMeet.day);    
      for(int i = 0; i < 5; i++){
        allEvents.forEach((eachEvent) { 
          DateTime eventStartDate = DateTime(eachEvent.startTime.year, eachEvent.startTime.month, eachEvent.startTime.day);
          DateTime eventEndDate = DateTime(eachEvent.endTime.year, eachEvent.endTime.month, eachEvent.endTime.day);
          if(toMeet.isAtSameMomentAs(eventStartDate) || toMeet.isAtSameMomentAs(eventEndDate)){
            toMeet = toMeet.add(const Duration(days: 1));
            // then tomorrow's date is invalid for a free day of meetings
          }
        });
        // if newTomorrow remains unchanged we can add it
        daysToPropose.add(toMeet);
        toMeet = toMeet.add(const Duration(days: 1));
        // print(daysToPropose);
      }
        
    // between two events - if there is a duration of time greater than  1hrs - then propose meeting time    
    DateTime dateToPropose;
    for(int i = 0; i < allEvents.length - 1 ; i++){       

      if(allEvents[i].isAllDay){
        i++;
      }else{
        if(allEvents[i + 1].startTime.difference(allEvents[i].endTime) > const Duration(hours: 1)){
          dateToPropose = allEvents[i].endTime.add(const Duration(minutes: 20));
                            
          if(dateToPropose.hour < 22 && dateToPropose.hour > 9){
            // print("going to propose this date: $dateToPropose");
            daysToPropose.add(dateToPropose);
          }    }
        }  
    }          
 
    print("daysToPropose: $daysToPropose");
    daysToPropose.sort();
    //add daysToPropose to group database so we can have a running list of dates to suggest.
    Map<String, Object> dates = {};
    int counter = 0;
    for(var item in daysToPropose){
      dates[counter.toString()] = item.toString();
      counter++;
    }
    DatabaseReference groupRef = FirebaseDatabase.instance.ref("groups/${widget.myGroup!["gId"]}/proposedDates");
    groupRef.update(dates);

    return daysToPropose;                
  }

  Future<DateTime> getFirstDate() async{
    final times = await FirebaseDatabase.instance.ref("groups/${widget.myGroup!["gId"]}/proposedDates").once();
    List<dynamic> dates = times.snapshot.value as List<dynamic>;
    if(times.snapshot.value != null) {
      return DateTime.parse(dates[0]);
    }
    return new DateTime(1932);
  }

  Future<int> removeCurrentDate() async{
    final times = await FirebaseDatabase.instance.ref("groups/${widget.myGroup!["gId"]}/proposedDates").once();
    if(times.snapshot.value == null){
      return -1;
    }
    List<dynamic> dates = times.snapshot.value as List<dynamic>;

    Map<String, Object> newDates = {};
    for(int i = 1; i < dates.length; i++){
      newDates[(i-1).toString()] = dates[i].toString();
    }
    DatabaseReference groupRef = FirebaseDatabase.instance.ref("groups/${widget.myGroup!["gId"]}/proposedDates");
    groupRef.set(newDates);

    return 1;
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
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.deepPurple),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: const [
                      Text(
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          "Group Code:"),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          "${widget.myGroup!["gId"]}"),
                    ],
                  ),
                ],
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
                                  builder: (context) => CalendarPage(
                                        title: "Calendar",
                                        group: widget.myGroup,
                                      )));
                        },
                        child: const Text('Calendar',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
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
                              content: Text(
                                  'This button is currently under development. Come back later!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: const Text('Edit Availabilities',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
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
                    children: <Widget>[
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {
                          // just printing proposal dates for now
                          findNextBestDate();                        
  
                        },
                        child: PlatformText('Suggest New Meeting Time',
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white)),
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
                        onPressed: () async{
                          await removeCurrentDate();
                        },
                        child: PlatformText('Cancel Active Meeting',
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white)),
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
                          //print(snapshot);
                          var membersWidget = snapshot.data!
                              .map((eachMember) => Text(
                                    eachMember["firstName"] +
                                        " " +
                                        eachMember["lastName"],
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.white),
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
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white),
                                    "Members"),
                                check
                              ]));
                        } else {
                          print("checking");
                          return PlatformText("");
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
                              content: Text(
                                  'This button is currently under development. Come back later!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: PlatformText('Edit Members',
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white)),
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
                                duration: const Duration(seconds: 2),
                              ),
                            );
                            Navigator.pop(context);
                          });
                        },
                        child: PlatformText('Leave Group',
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white)),
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
                            socialMediaText.add(Text("$key Users: $value",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white)));
                          });
                        }
                        var check = Column(children: socialMediaText);
                        return Container(
                          child: check,
                        );
                      }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
