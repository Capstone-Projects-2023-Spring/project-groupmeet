import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'social_media_sign_up_onboarding.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:googleapis/calendar/v3.dart' as google_api;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';

import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;
import 'package:date_utils/date_utils.dart' as Utils;

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  GoogleSignInAccount? _currentUser;
  late DatabaseReference ref;

  @override
  void initState() {
    super.initState();
    String temp = FirebaseAuth.instance.currentUser?.uid ?? "";
    ref = FirebaseDatabase.instance.ref("users/$temp");
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

  Future<void> getGoogleCalendar() async {
    // Google Calendar API
    await _handleSignIn();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });

    // Retrieve an [auth.AuthClient] from the current [GoogleSignIn] instance.
    final auth.AuthClient? client = await _googleSignIn.authenticatedClient();
    assert(client != null, 'Authenticated client missing!');

    // Prepare a calendar authenticated client.
    final google_api.CalendarApi calendarApi = google_api.CalendarApi(client!);
    DateTime end = Utils.DateUtils.lastDayOfMonth(DateTime.now());
    DateTime start = Utils.DateUtils.firstDayOfMonth(DateTime.now());
    final google_api.Events calEvents = await calendarApi.events.list("primary", timeMax: end.toUtc(), timeMin: start.toUtc());

    //get uid and open database reference
    final String? uid = FirebaseAuth.instance.currentUser?.uid;

    //list of events to add to firebase (temporarily just printing)
    List<google_api.Event> eventItems = calEvents.items!;
    //array that holds all critical information from each item.
    List<List<String?>> events = [];
    for (var element in eventItems) {
      //create array of objects to be added to CalendarEvents
      List<String?> temp = [element.start!.date.toString(),element.start!.dateTime.toString(),element.end!.date.toString(),element.end!.dateTime.toString()];
      print(temp);
      events.add(temp);
    }
    await ref.update({
      "calendarEvents":events
    });
  }
@override 
Widget build(BuildContext context) {
    return PlatformScaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(50, 0,50, 20),
            child: Material(
              borderRadius: BorderRadius.circular(65),
              elevation: 2,
              child: const CircleAvatar(
                backgroundColor: Color.fromARGB(230, 81, 63, 219),
                radius: 75,
              ),
            )),
           const Padding(padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
           child:
            Text(
              style: TextStyle(fontSize: 40),
              "Round Up"),
           ),
        const Text(
            style: TextStyle(fontSize: 15),
            "Link third-party calendars to be used "),
        const Text("with Round (optional)"),
        Padding(padding: const EdgeInsets.fromLTRB(50, 50, 50, 150),
        child:  
        PlatformElevatedButton(
          onPressed: () async{
            await getGoogleCalendar();
          },
          material: (context, platform) => MaterialElevatedButtonData(
              style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            fixedSize: const Size(125, 10),
            backgroundColor: const Color.fromARGB(255, 38, 61, 80),
          )),
          child: const Text(style: TextStyle(color: Colors.blue), "Google"),
        ),        
        ),        
        PlatformElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              platformPageRoute(
                  context: context,
                  builder: (_) => const SocialMediaOnboarding()),
            );
          },
          material: (_, __) => MaterialElevatedButtonData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
             side: const BorderSide(                  
                  width: 5.0,
                  color: Color.fromARGB(255, 89, 4, 106),
                ),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(24),            
          ), 
                 ),
              cupertino: (_, __) => CupertinoElevatedButtonData(),
              child: Icon(color: Colors.black,
                PlatformIcons(context).forward),              
            )
      ]),
    ));
  }
}
