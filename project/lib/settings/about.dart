import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:groupmeet/group/all_groups.dart';
import 'package:groupmeet/group/add_event.dart';
import 'package:googleapis/calendar/v3.dart' as google_api;
import 'package:date_utils/date_utils.dart' as utils;
import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;

class About extends StatefulWidget {
  const About({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<About> createState() => AboutState();
}

@visibleForTesting
class AboutState extends State<About> {
  late DatabaseReference ref;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[google_api.CalendarApi.calendarScope],
  );
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    String temp = FirebaseAuth.instance.currentUser?.uid ?? "";
    ref = FirebaseDatabase.instance.ref("users/$temp");
  }

  Future<void> getPrimaryCalendar() async {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();

    final auth.AuthClient? client = await _googleSignIn.authenticatedClient();
    if (client == null) {
      const snackBar = SnackBar(
        content: Text('Authenticated client missing!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    final google_api.CalendarApi calendarApi = google_api.CalendarApi(client);
    DateTime end = utils.DateUtils.lastDayOfMonth(DateTime.now());
    DateTime start = utils.DateUtils.firstDayOfMonth(DateTime.now());
    final google_api.Events calEvents = await calendarApi.events
        .list("primary", timeMax: end.toUtc(), timeMin: start.toUtc());

    late DatabaseReference ref = widget.key as DatabaseReference;
    final String? uid = FirebaseAuth.instance.currentUser?.uid;

    List<google_api.Event> eventItems = calEvents.items!;

    List<List<String?>> events = [];
    for (var element in eventItems) {
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
    const snackBar = SnackBar(
      content: Text('Sync Successful!'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              Column(
                children: [
                  PlatformText("Sync My Calendars"),
                  PlatformText(
                      "WARNING: This will override any custom events created."),
                  PlatformIconButton(
                    onPressed: () async {
                      await getPrimaryCalendar();
                    },
                    icon: Icon(PlatformIcons(context).refresh),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  PlatformText("All Groups"),
                  PlatformIconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          platformPageRoute(
                              context: context,
                              builder: (context) => AllGroups(
                                  title: "Display All Groups Here", ref: ref)),
                        );
                      },
                      icon: Icon(
                        PlatformIcons(context).group,
                        color: Colors.white,
                      ))
                ],
              )
            ],
          ),
          Column(
            children: [
              PlatformText("Add Event"),
              PlatformIconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    platformPageRoute(
                      context: context,
                      builder: (context) =>
                          AddEvent(title: "Add New Event", ref: ref),
                    ),
                  );
                },
                icon: Icon(PlatformIcons(context).add, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
