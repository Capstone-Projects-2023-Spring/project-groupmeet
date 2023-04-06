import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:groupmeet/theme.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key, required this.title, required this.group});

  final Map<dynamic, dynamic>? group;
  final String title;

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
 
  List<Appointment> allEvents = [];
  Future<List<Appointment>> getData() async{    
    DatabaseReference ref =  FirebaseDatabase.instance.ref("users");    

    //grabbing all members' google events
    for (var memberId in widget.group!["members"].entries) {      
      final memberSnapshot = await ref.child(memberId.key+"/calendarEvents").get();
      if(memberSnapshot.value == null) continue;
      for (var event in memberSnapshot.value as List){
        var tempStart;
        var tempEnd;
        event[0] == "null" ? tempStart = event[1] : tempStart = event[0];
        event[2] == "null" ? tempEnd = event[3] : tempEnd = event[2];

        allEvents.add(Appointment(startTime: DateTime.parse(tempStart), endTime: DateTime.parse(tempEnd)));
      }

    //grabbing all members' round events
    final roundMeetingsSnapshot = await ref.child("${memberId.key}/roundMeetings").get();   
    for (var element in roundMeetingsSnapshot.children) { 
      var eachEvent = element.value as Map;      
      allEvents.add(Appointment(startTime: DateTime.parse(eachEvent["startTime"]), endTime: DateTime.parse( eachEvent["endTime"]), color: roundPurple));     
    }              
    }    
    return allEvents;  
  }

  

  //depending on where this function is being called from - may not need to add the new meeting to allEvents 
  //(otherwise the event will be added 2x to the calendar)
  // then make allEvents private within getData and remove the set state
  Future<void> chosenDateAddedToCalendar(DateTime begTime, DateTime finTime, String meetingName, ) async {
    //storing in different branch because sync button for google calendar will erase all previous meetings?
    Appointment roundMeeting = Appointment(startTime: begTime, endTime: finTime, subject: meetingName, color: roundPurple);

    for (var memberId in widget.group!["members"].entries) {            
      DatabaseReference ref =  FirebaseDatabase.instance.ref("users/${memberId.key}/roundMeetings");
      String key = ref.push().key as String;
      ref.update({key : {"startTime" : roundMeeting.startTime.toString(), "endTime" :roundMeeting.endTime.toString(), "meetingName": roundMeeting.subject}});

    }    
    setState(() {
      allEvents.add(roundMeeting);  
    });
    

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Calendar'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Stack(
            children: [
              SfCalendar(
                view: CalendarView.month,
                dataSource: Event(events: snapshot.data ?? []),
                monthViewSettings: const MonthViewSettings(
                  appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                  showAgenda: true,
                ),
              ),
              snapshot.data != null
              ? Container() : Container(),
            ],
          );
          },
        ),
    );
  }
}

class Event extends CalendarDataSource {
  Event({required List<Appointment> events}){
    appointments = events;
  }
}
