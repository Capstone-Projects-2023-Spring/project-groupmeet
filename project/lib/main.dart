import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/theme.dart';
import 'package:permission_handler/permission_handler.dart';

import 'login.dart';

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
    final materialTheme = ThemeData(
      primaryColor: roundPurple,
      scaffoldBackgroundColor: roundBlack,
      brightness: Brightness.dark,
      platform: TargetPlatform.android,
      hintColor: Colors.white,
      buttonColor: roundPurple,
      buttonTheme: const ButtonThemeData(buttonColor: roundPurple),
    );

    const cupertinoTheme = CupertinoThemeData(
        primaryColor: roundPurple,
        barBackgroundColor: roundPurple,
        scaffoldBackgroundColor: roundBlack,
        primaryContrastingColor: Colors.white,
        brightness: Brightness.dark,
        textTheme: CupertinoTextThemeData(primaryColor: Colors.white));

    return PlatformApp(
        debugShowCheckedModeBanner: false,
        material: (context, platform) =>
            MaterialAppData(theme: materialTheme, color: roundPurple),
        cupertino: (context, platform) =>
            CupertinoAppData(theme: cupertinoTheme, color: roundPurple),
        home: const LoginScreen(),
        title: "Round",
        color: roundPurple);
  }
}
