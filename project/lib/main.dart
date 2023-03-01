import 'package:flutter/material.dart';
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
        primarySwatch: Colors.pink,
        platform: TargetPlatform.iOS,
      ),
      home: const LoginScreen(),
    );
  }
}