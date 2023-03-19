import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// change to commented out after groupHome is no longer accessible from main.dart (my group is not available in main.dart)
class CalendarPage extends StatefulWidget {
  // const GroupHomePage({super.key, required this.title, required this.myGroup});
  const CalendarPage({super.key, required this.title});

  final String title;

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SfCalendar(
        view: CalendarView.month,
      ),
    );
  }
}
