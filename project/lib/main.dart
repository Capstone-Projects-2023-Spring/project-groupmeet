import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/onboarding/explainer.dart';
import 'package:groupmeet/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'home.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const RoundApp());
}

class RoundApp extends StatelessWidget {
  const RoundApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final materialTheme = ThemeData(
        primaryColor: roundPurple,
        scaffoldBackgroundColor: roundBlack,
        brightness: Brightness.dark,
        platform: TargetPlatform.android,
        hintColor: Colors.white,
        focusColor: roundPurple,
        highlightColor: roundPurple,
        inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: roundPurple)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: roundPurple))),
        textSelectionTheme: const TextSelectionThemeData(
            selectionColor: roundPurple,
            cursorColor: roundPurple,
            selectionHandleColor: roundPurple),
        dividerColor: roundPurple,
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
                surfaceTintColor: MaterialStatePropertyAll(roundPurple))),
        cardColor: roundPurple,
        fontFamily: "Urbanist");

    const cupertinoTheme = CupertinoThemeData(
        primaryColor: roundPurple,
        barBackgroundColor: roundPurple,
        scaffoldBackgroundColor: roundBlack,
        primaryContrastingColor: Colors.white,
        brightness: Brightness.dark,
        textTheme: CupertinoTextThemeData(
            primaryColor: Colors.white,
            textStyle: TextStyle(fontFamily: "Urbanist")));

    Widget firstStop;

    User? user = FirebaseAuth.instance.currentUser;
    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    if (user != null) {
      firstStop = HomeScreen(firebaseDatabase: firebaseDatabase, firebaseAuth: FirebaseAuth.instance,);
    } else {
      firstStop = Explainer(pageNo: 0);
    }

    return PlatformApp(
        checkerboardOffscreenLayers: false,
        checkerboardRasterCacheImages: false,
        debugShowCheckedModeBanner: false,
        material: (context, platform) =>
            MaterialAppData(theme: materialTheme, color: roundPurple),
        cupertino: (context, platform) => CupertinoAppData(
                theme: cupertinoTheme,
                color: roundPurple,
                localizationsDelegates: [
                  DefaultCupertinoLocalizations.delegate,
                  DefaultMaterialLocalizations.delegate,
                  DefaultWidgetsLocalizations.delegate,
                ]),
        home: firstStop, //Explainer(pageNo: 0),
        title: "Round",
        color: roundPurple);
  }
}
