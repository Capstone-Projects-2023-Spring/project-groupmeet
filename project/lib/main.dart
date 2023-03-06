import 'package:flutter/material.dart';
import 'package:groupmeet/all_groups.dart';
import 'package:groupmeet/code_sharing.dart';
import 'package:firebase_core/firebase_core.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // text on other pages are not visible with these uncommented with dark text on dark
        // uncomment when UI of other pages are changed?
        // scaffoldBackgroundColor: const Color(0x000000),
        // textTheme: Typography.whiteHelsinki,
        primarySwatch: Colors.pink,
        platform: TargetPlatform.iOS,
      ),
      home: const LoginScreen(),
    );
  }
}
