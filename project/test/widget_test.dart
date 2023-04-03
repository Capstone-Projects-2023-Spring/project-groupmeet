// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:groupmeet/home.dart';
import 'package:groupmeet/settings.dart';
import './mock.dart'; // from: https://github.com/FirebaseExtended/flutterfire/blob/master/packages/firebase_auth/firebase_auth/test/mock.dart

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized(); Gets called in setupFirebaseAuthMocks()
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  test("unit test example", () {
    const widget = HomeScreen(title: "Test");
    widget.createElement();
    expect(widget.title, "Test");
  });

  testWidgets('Title test for Settings Screen', (WidgetTester tester) async {
    // Tests to write
    Widget testWidget = const MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(home: Settings(title: "Test",))
    );
    await tester.pumpWidget(testWidget);
    final SettingsState settingsState = tester.state(find.byType(Settings));
    expect(settingsState.widget.title, "Test");
  });
}
