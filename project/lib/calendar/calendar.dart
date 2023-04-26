import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:groupmeet/theme.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:googleapis/calendar/v3.dart' as google_api;
import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;
import 'package:date_utils/date_utils.dart' as utils;
import 'package:groupmeet/settings/add_event.dart';

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
                       
      allEvents.add(Appointment(startTime: DateTime.parse(eachEvent["startTime"]), endTime: DateTime.parse( eachEvent["endTime"]), color: (int.parse(widget.group!["gId"])  == eachEvent["gId"] ? roundPurple : Colors.blue )));    
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
      ref.update({key : {"startTime" : roundMeeting.startTime.toString(), "endTime" :roundMeeting.endTime.toString(), "meetingName": roundMeeting.subject, "gId": widget.group!["gId"]}});

    }    
    setState(() {
      allEvents.add(roundMeeting);  
    });
    

  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: '[YOUR_OAUTH_2_CLIENT_ID]',
    scopes: <String>[google_api.CalendarApi.calendarScope],
  );

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  GoogleSignInAccount? _currentUser;

  Future<void> getPrimaryCalendar() async {
    // Google Calendar API
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });

    await _handleSignIn();
    // Retrieve an [auth.AuthClient] from the current [GoogleSignIn] instance.
    final auth.AuthClient? client = await _googleSignIn.authenticatedClient();
    if (client == null) {
      print("null client");
      return;
    }

    // Prepare a calendar authenticated client.
    final google_api.CalendarApi calendarApi = google_api.CalendarApi(client);
    DateTime end = utils.DateUtils.lastDayOfMonth(DateTime.now());
    DateTime start = utils.DateUtils.firstDayOfMonth(DateTime.now());
    final google_api.Events calEvents = await calendarApi.events
        .list("primary", timeMax: end.toUtc(), timeMin: start.toUtc());

    final String? uid = FirebaseAuth.instance.currentUser?.uid;

    if(uid == null) {
      return;
    }

    //get uid and open database reference
    late DatabaseReference ref = FirebaseDatabase.instance.ref("users/${uid}");

    //list of events to add to firebase (temporarily just printing)
    List<google_api.Event> eventItems = calEvents.items!;
    //array that holds all critical information from each item.
    List<List<String?>> events = [];
    for (var element in eventItems) {
      //create array of objects to be added to CalendarEvents
      List<String?> temp = [
        element.start!.date.toString(),
        element.start!.dateTime.toString(),
        element.end!.date.toString(),
        element.end!.dateTime.toString()
      ];
      print(temp);
      events.add(temp);
    }
    await ref.update({"calendarEvents": events});

  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText('Manual Calendar'),
        trailingActions: [
          PlatformIconButton(icon: Icon(PlatformIcons(context).add, color: Colors.white), onPressed:() {

            if(FirebaseAuth.instance.currentUser?.uid == null) {
              return;
            }

            DatabaseReference ref = FirebaseDatabase.instance.ref("users/${FirebaseAuth.instance.currentUser!.uid}");

            Navigator.of(context).push(
              platformPageRoute(
                context: context,
                builder: (context) =>
                    AddEvent(title: "Add New Event", ref: ref),
              ),
            );
          },)
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Stack(
            children: [
              SfCalendar(
                view: CalendarView.month,
                todayHighlightColor: roundPurple,
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
