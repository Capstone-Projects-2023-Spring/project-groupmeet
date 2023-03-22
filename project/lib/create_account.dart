import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'home.dart';

import 'package:googleapis/calendar/v3.dart' as google_api;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';

import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key, required this.title});
  final String title;

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();

  late DatabaseReference ref;
  String? uid;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _creatingProfile = false;

  createUserProfile(BuildContext context) async {
    await getPrimaryCalendar();

    setState(() {
      _creatingProfile = true;
    });

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    )
        .then((authResult) async {
      uid = authResult.user?.uid;
      ref = FirebaseDatabase.instance.ref("users/$uid");
      ref.set({
        "email": _emailController.text.trim(),
        "firstName": _fnameController.text.trim(),
        "lastName": _lnameController.text.trim(),
        "discord": false,
        "facebook": false,
        "instagram": false,
        "messages": false,
        "snapchat": false,     
        "calendarEvents": userEvents   
      });
      setState(() {
        _creatingProfile = false;
      });
      _emailController.dispose();
      _passwordController.dispose();
      _fnameController.dispose();
      _lnameController.dispose();
     
    }).catchError((e) {
      setState(() {
        _creatingProfile = false;
      });
      if (e is FirebaseAuthException) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The password provided is too weak.'),
              duration: Duration(seconds: 5),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The account already exists for that email.'),
              duration: Duration(seconds: 5),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred: $e'),
            duration: const Duration(seconds: 5),
          ),
        );
      }
    });

    _navigateToHomeScreen();
  }

  @override
  void initState() {
    super.initState();

    // Google Calendar API
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        // getPrimaryCalendar();
      }
    });
    // _googleSignIn.signInSilently();
    _handleSignIn();
    // getPrimaryCalendar();
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

  late Map<dynamic, dynamic> userEvents;
  Future<void> getPrimaryCalendar() async {
    // Retrieve an [auth.AuthClient] from the current [GoogleSignIn] instance.
    final auth.AuthClient? client = await _googleSignIn.authenticatedClient();
    assert(client != null, 'Authenticated client missing!');
  
    // Prepare a calendar authenticated client.
    final google_api.CalendarApi calendarApi = google_api.CalendarApi(client!);
    final google_api.Events calEvents =
    await calendarApi.events.list("primary", timeMin: DateTime.now(), timeMax: DateTime.now().add(const Duration(days: 30)));

    //list of events to add to firebase (temporarily just printing)
    List<google_api.Event> eventItems = calEvents.items!;
    // for (var element in eventItems) {
    //   print(element.summary);
    //   print("Start Date: ${element.start!.date}");
    //   print("End Date ${element.end!.date}");
    // }
  
    userEvents = {
      for (var eachEvent in eventItems)
        '${eachEvent.id}': {
          "summary": eachEvent.summary,          
          "startDate": (eachEvent.start?.date) != null ? DateTime.parse(eachEvent.start!.date.toString()).toString() : "null",          
          "startDateTime": (eachEvent.start?.dateTime) != null ? DateTime.parse(eachEvent.start!.dateTime.toString()).toString() : "null",          
          "endDate": (eachEvent.end?.date) != null ? DateTime.parse(eachEvent.end!.date.toString()).toString() : "null",
          "endDateTime": (eachEvent.end?.dateTime) != null ? DateTime.parse(eachEvent.end!.dateTime.toString()).toString() : "null",          
        }
    };
  }

   void _navigateToHomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const HomeScreen(title: 'HomeScreen'),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      key: _scaffoldKey,
     appBar: PlatformAppBar(
        title: PlatformText(widget.title),
    ),
      body: Center(
        child: Column(
          children: [
            PlatformTextField(
              hintText: "First Name",
                controller: _fnameController,
                keyboardType: TextInputType.name,
                material: (_, __) => MaterialTextFieldData(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "First Name",
                    )
                ),
            ),
            PlatformTextField(
                controller: _lnameController,
                hintText: "Last Name",
                keyboardType: TextInputType.name,
                material: (_, __) => MaterialTextFieldData(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Last Name",
                    )
                )
            ),
            PlatformTextField(
              hintText: "Email",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              material: (_, __) => MaterialTextFieldData(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  )
              ),
                ),
            PlatformTextField(
              hintText: "Password",
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              material: (_, __) => MaterialTextFieldData(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  )
              ),
              obscureText: true,
            ),
            PlatformElevatedButton(
                onPressed: _creatingProfile ? null : () => createUserProfile(context),
                child: _creatingProfile
                    ? const CircularProgressIndicator()
                    : const Text("Create Account")),           
          ],
        ),
      ),
    );
  }
}
