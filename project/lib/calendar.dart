import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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
  Future<List<Appointment>> getData() async {
    List<Appointment> allEvents = [];
    DatabaseReference ref = FirebaseDatabase.instance.ref("users");

    // Not being used
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

        allEvents.add(Appointment(
            startTime: DateTime.parse(tempStart),
            endTime: DateTime.parse(tempEnd)));
      }
    }

    return allEvents;
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
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment,
                  showAgenda: true,
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
  Event({required List<Appointment> events}) {
    appointments = events;
  }
}
