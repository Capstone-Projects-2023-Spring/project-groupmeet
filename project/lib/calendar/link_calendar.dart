import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart' as google_api;
import 'package:date_utils/date_utils.dart' as utils;
import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;

class LinkCalendar extends StatelessWidget {
  LinkCalendar({super.key});

  bool fromSettings = false;

  late DatabaseReference ref;

  GoogleSignInAccount? _currentUser;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: '[YOUR_OAUTH_2_CLIENT_ID]',
    scopes: <String>[google_api.CalendarApi.calendarScope],
  );

  Future<void> pressedGoogle(BuildContext context) async {
    String temp = FirebaseAuth.instance.currentUser?.uid ?? "";
    ref = FirebaseDatabase.instance.ref("users/$temp");

    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      _currentUser = account;
    });

    final auth.AuthClient? client = await _googleSignIn.authenticatedClient();
    assert(client != null, 'Authenticated client missing!');

    // Prepare a calendar authenticated client.
    final google_api.CalendarApi calendarApi = google_api.CalendarApi(client!);
    DateTime end = utils.DateUtils.lastDayOfMonth(DateTime.now());
    DateTime start = utils.DateUtils.firstDayOfMonth(DateTime.now());
    final google_api.Events calEvents = await calendarApi.events
        .list("primary", timeMax: end.toUtc(), timeMin: start.toUtc());

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

    await ref.update({"has_calendar": true});

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return PlatformScaffold(
        body: Center(
            child: Column(
      children: [
        SizedBox(
            width: screenWidth,
            height:
                MediaQuery.of(context).viewPadding.top + 0.08 * screenHeight),
        Image.asset(
          "images/RoundTable.png",
          height: 242,
          width: screenWidth,
          isAntiAlias: true,
        ),
        SizedBox(width: screenWidth, height: 8),
        PlatformText("Round Up",
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w600)),
        SizedBox(width: screenWidth, height: 32),
        Padding(
            padding:
                EdgeInsets.symmetric(horizontal: screenWidth / 8, vertical: 0),
            child: PlatformText(
              "Link third-party calendars to be used with Round (optional)",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            )),
        SizedBox(width: screenWidth, height: 32),
        SizedBox(
            width: 180,
            child: PlatformElevatedButton(
                color: const Color.fromRGBO(45, 140, 255, 0.3),
                onPressed: () => pressedGoogle(context),
                child: PlatformText("Google"))),
        SizedBox(width: screenWidth, height: 16),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: screenWidth, height: 16),
                PlatformText("© 2023 Round Corp\nFrom Philly with Love 🤍",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 10)),
                SizedBox(
                  width: screenWidth,
                  height: 32,
                )
              ],
            ),
          ),
        ),
      ],
    )));
  }
}
