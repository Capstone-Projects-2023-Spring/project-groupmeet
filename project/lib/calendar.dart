import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:googleapis/calendar/v3.dart' as googleAPI;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';

import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;
import 'package:http/src/client.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// change to commented out after groupHome is no longer accessible from main.dart (my group is not available in main.dart)
class CalendarPage extends StatefulWidget {
  // const GroupHomePage({super.key, required this.title, required this.myGroup});
  const CalendarPage({super.key, required this.title, required this.group});

  final Map<dynamic, dynamic>? group;
  final String title;

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  
  Future<List<Appointment>> getData() async{
    List<Appointment> allEvents = [];
    DatabaseReference ref = await FirebaseDatabase.instance.ref("users");

    Map<dynamic, dynamic> allMemberEvents;

    for (var memberId in widget.group!["members"].entries) {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Event Calendar'),
      ),
      body: Container(
      child: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: Stack(
              children: [
                Container(
                  child: SfCalendar(
                    view: CalendarView.month,
                    dataSource: Event(events: snapshot.data ?? []),
                    monthViewSettings: const MonthViewSettings(
                      appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                      showAgenda: true,
                    ),
                  ),
                ),
                snapshot.data != null
                ? Container() : Container(),
              ],
            ));
          },
        ),
      ),
    );
  }
}

class Event extends CalendarDataSource {
  Event({required List<Appointment> events}){
    this.appointments = events;
  }
}
