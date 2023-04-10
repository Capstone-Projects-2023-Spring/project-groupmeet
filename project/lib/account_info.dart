import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'socials.dart';
import 'edit_account.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:googleapis/calendar/v3.dart' as google_api;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';

import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;
import 'package:date_utils/date_utils.dart' as utils;

class AccountInfo extends StatefulWidget {
  const AccountInfo({Key? key, required this.title, required this.ref})
      : super(key: key);

  final String title;
  final DatabaseReference ref;

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  late String name;
  late String email;
  late DatabaseReference ref;

  @override
  void initState() {
    super.initState();
    name = "";
    email = "";
    getData();

    String temp = FirebaseAuth.instance.currentUser?.uid ?? "";
    ref = FirebaseDatabase.instance.ref("users/$temp");
  }

  void getData() async {
    DatabaseEvent event = await widget.ref.once();
    if (event.snapshot.exists) {
      setState(() {
        name =
            "${event.snapshot.child("firstName").value} ${event.snapshot.child("lastName").value}";
        email = event.snapshot.child("email").value.toString();
      });
    }
  }

  // Google Calendar API
  // move google sign in to account creation after it is working for everyone?
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
    if(client == null) {
      const snackBar = SnackBar(
        content: Text('Authenticated client missing!'),
      );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    // Prepare a calendar authenticated client.
    final google_api.CalendarApi calendarApi = google_api.CalendarApi(client!);
    DateTime end = utils.DateUtils.lastDayOfMonth(DateTime.now());
    DateTime start = utils.DateUtils.firstDayOfMonth(DateTime.now());
    final google_api.Events calEvents = await calendarApi.events
        .list("primary", timeMax: end.toUtc(), timeMin: start.toUtc());

    //get uid and open database reference
    late DatabaseReference ref = widget.ref;
    final String? uid = FirebaseAuth.instance.currentUser?.uid;

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
        title: PlatformText(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                PlatformText("Name:"),
                PlatformText(name),
              ],
            ),
            Column(
              children: [
                PlatformText("Email:"),
                PlatformText(email),
              ],
            ),
            PlatformText("Edit Account Information"),
            PlatformIconButton(
              onPressed: () async {
                await Navigator.of(context).push(
                  platformPageRoute(
                    context: context,
                    builder: (context) =>
                        EditAccountInfo(title: "Edit My Account", ref: ref),
                  ),
                );
                getData();
              },
              icon: const Icon(Icons.create),
            ),
            PlatformText("Edit Social Media Accounts"),
            PlatformIconButton(
              onPressed: () {
                Navigator.of(context).push(
                  platformPageRoute(
                    context: context,
                    builder: (context) => SocialMedia(databaseReference: ref),
                  ),
                );
              },
              icon: Icon(PlatformIcons(context).create),
            ),
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
      ),
    );
  }
}
