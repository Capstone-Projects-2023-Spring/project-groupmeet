
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:groupmeet/new_social_onboarding.dart';
import 'package:googleapis/calendar/v3.dart' as google_api;
import 'package:date_utils/date_utils.dart' as Utils;
import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;



class NewCalendarSelection extends StatelessWidget {
  NewCalendarSelection({
    super.key
  });

  GoogleSignInAccount? _currentUser;
  late DatabaseReference ref;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: '[YOUR_OAUTH_2_CLIENT_ID]',
    scopes: <String>[google_api.CalendarApi.calendarScope],
  );

  void buttonPress(BuildContext context) {
    Navigator.of(context).push(platformPageRoute(context: context, builder: (context) => NewSocialOnboarding()));
  }

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

  void pressedApple(BuildContext context) {
    PlatformAlertDialog error = PlatformAlertDialog(
      title: PlatformText("Whoops!"),
      content: PlatformText("iCloud support may be available in the future, but not right now!"),
      actions: [
        PlatformTextButton(child: PlatformText("Ok"),
          onPressed: () => Navigator.of(context).pop(),)
      ],);

    showPlatformDialog(context: context, builder: (context) {
      return error;
    },);
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return PlatformScaffold(
        body: Center(
            child: Column(
              children: [
                SizedBox(width: screenWidth, height: MediaQuery.of(context).viewPadding.top + 0.08 * screenHeight),
                Image.asset(
                    "Images/RoundTable.png", height: 242, width: screenWidth
                ),
                SizedBox(width: screenWidth, height: 8),
                PlatformText("Round Up",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600)),
                SizedBox(width: screenWidth, height: 32),
                Padding(padding: EdgeInsets.symmetric(horizontal: screenWidth / 8, vertical: 0), child:PlatformText(
                  "Link third-party calendars to be used with Round (optional)",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )),
                SizedBox(width: screenWidth, height: 32),
                SizedBox(width: 180, child: PlatformElevatedButton(child: PlatformText("Google"), color: Color.fromRGBO(45, 140, 255, 0.3), onPressed: () => pressedGoogle(context))),
                SizedBox(width: screenWidth, height: 16),
                SizedBox(width: 180, child: PlatformElevatedButton(child: PlatformText("iCloud"), color: Color.fromRGBO(170, 170, 170, 0.3), onPressed: () => pressedApple(context))),

                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 64, width: 64, child:
                        PlatformIconButton(icon:
                        Image.asset(
                            "Images/OnboardingNext.png", height: 64, width: 64
                        ), padding: EdgeInsets.zero, onPressed: () => buttonPress(context),)),
                        SizedBox(width: screenWidth, height: 16),
                        PlatformText("© 2023 Round Corp\nFrom Philly with Love 🤍",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10)),
                        SizedBox(width: screenWidth, height: 32,)
                      ],),
                  ),
                ),
              ],

            )
        )
    );
  }
}