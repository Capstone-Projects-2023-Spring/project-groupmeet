import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/explainer.dart';
import 'package:groupmeet/home.dart';
import 'package:groupmeet/social_media_sign_up_onboarding.dart';
import 'package:groupmeet/theme.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';
import 'new_home.dart';
import 'new_signin.dart';
import 'new_signup.dart';

// Initialize the app and run it.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

// The main app widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Build the app widget.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final materialTheme = ThemeData(
      primaryColor: roundPurple,
      scaffoldBackgroundColor: roundBlack,
      brightness: Brightness.dark,
      platform: TargetPlatform.android,
      hintColor: Colors.white,
      buttonColor: roundPurple,
      focusColor: roundPurple,
      highlightColor: roundPurple,
      accentColor: roundPurple,
      inputDecorationTheme: InputDecorationTheme(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: roundPurple)), enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: roundPurple))),
      textSelectionTheme: TextSelectionThemeData(selectionColor: roundPurple, cursorColor: roundPurple, selectionHandleColor: roundPurple),
      dividerColor: roundPurple,
      textButtonTheme: TextButtonThemeData(style: ButtonStyle(surfaceTintColor: MaterialStatePropertyAll(roundPurple))),
      cardColor: roundPurple,
      fontFamily: "Urbanist"
    );

    const cupertinoTheme = CupertinoThemeData(
        primaryColor: roundPurple,
        barBackgroundColor: roundPurple,
        scaffoldBackgroundColor: roundBlack,
        primaryContrastingColor: Colors.white,
        brightness: Brightness.dark,
        textTheme: CupertinoTextThemeData(
          primaryColor: Colors.white,
          textStyle: TextStyle(fontFamily: "Urbanist")
        ));

    Widget firstStop;

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      firstStop = NewHome();
    } else {
      firstStop = Explainer(pageNo: 0);
    }

    return PlatformApp(
        checkerboardOffscreenLayers: false,
        checkerboardRasterCacheImages: false,
        debugShowCheckedModeBanner: false,
        material: (context, platform) =>
            MaterialAppData(theme: materialTheme, color: roundPurple),
        cupertino: (context, platform) =>
            CupertinoAppData(theme: cupertinoTheme, color: roundPurple),
        home: firstStop,//Explainer(pageNo: 0),
        title: "Round",
        color: roundPurple);
  }
}
