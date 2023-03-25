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
  const CalendarPage({super.key, required this.title});

  final String title;

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // serverClientId:
    // 'OAuth Client ID',
    scopes: <String>[
      googleAPI.CalendarApi.calendarScope,
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Event Calendar'),
      ),
      body: Container(
        child: FutureBuilder(
          future: getGoogleEventsData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
                child: Stack(
                  children: [
                    Container(
                      child: SfCalendar(
                        view: CalendarView.month,
                        dataSource: GoogleDataSource(events: snapshot.data ?? []),
                        monthViewSettings: MonthViewSettings(
                          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                          showAgenda: true,
                        ),
                      ),
                    ),
                    snapshot.data != null
                        ? Container()
                        : Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }

  @override
  void dispose(){
    if(_googleSignIn.currentUser != null) {
      _googleSignIn.disconnect();
      _googleSignIn.signOut();
    }

    super.dispose();
  }

  Future<List<googleAPI.Event>> getGoogleEventsData() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleAPIClient httpClient =
    GoogleAPIClient(await googleUser!.authHeaders);
    final googleAPI.CalendarApi calendarAPI = googleAPI.CalendarApi(httpClient as Client);
    final googleAPI.Events calEvents = await calendarAPI.events.list(
      "primary",
    );
    final List<googleAPI.Event> appointments = <googleAPI.Event>[];
    if (calEvents != null && calEvents.items != null) {
      for (int i = 0; i < calEvents.items!.length; i++) {
        final googleAPI.Event event = calEvents.items![i];
        if (event.start == null) {
          continue;
        }
        appointments.add(event);
      }
    }
    return appointments;
  }
}

class GoogleDataSource extends CalendarDataSource {
  GoogleDataSource({required List<googleAPI.Event> events}) {
    this.appointments = events;
  }

  @override
  DateTime getStartTime(int index) {
    final googleAPI.Event event = appointments![index];
    return event.start?.date ?? event.start!.dateTime!.toLocal();
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].start.date != null;
  }

  @override
  DateTime getEndTime(int index) {
    final googleAPI.Event event = appointments?[index];
    return event.endTimeUnspecified != null && event.endTimeUnspecified!
        ? (event.start?.date ?? event.start!.dateTime!.toLocal())
        : (event.end!.date != null
        ? event.end!.date!.add(Duration(days: -1))
        : event.end!.dateTime!.toLocal());
  }

  @override
  String getLocation(int index) {
    return appointments![index].location ?? "";
  }

  @override
  String getNotes(int index) {
    return appointments?[index].description ?? "";
  }
}

class GoogleAPIClient extends IOClient {
  Map<String, String> _headers;

  GoogleAPIClient(this._headers) : super();

  @override
  Future<IOStreamedResponse> send(BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<Response> head(url, {Map<String, String>? headers}) =>
      super.head(url, headers: headers?..addAll(_headers));
}
