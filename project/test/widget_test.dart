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

import 'package:mockito/mockito.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:groupmeet/group_home.dart';

class MockDatabaseReference extends Mock implements DatabaseReference {}

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized(); Gets called in setupFirebaseAuthMocks()
  setupFirebaseAuthMocks();

  group('getEventList', () {
    final mockRef = MockDatabaseReference();

    test('returns a list of appointments from database', () async {
      // Arrange
    //   when(mockRef.child(any)).thenAnswer((Invocation invocation) async =>
    //   Future<DataSnapshot>.value(DataSnapshot(value: {'event1': ['2023-04-11T08:00:00Z', '2023-04-11T09:00:00Z']})));
    //   final widget = GroupHomePage(title: 'Test', databaseReference: mockRef, myGroup: {'members': {'member1': true}});
    //
    //   // Act
    //   final result = await widget.createState().getEventList();
    //
    //   // Assert
    //   expect(result.length, 1);
    //   expect(result.first.startTime, DateTime.utc(2023, 04, 11, 8, 0));
    //   expect(result.first.endTime, DateTime.utc(2023, 04, 11, 9, 0));
    // });
    //
    // test('returns an empty list if no appointments in database', () async {
    //   // Arrange
    //   when(mockRef.child(any)).thenAnswer((Invocation invocation) async =>
    //   Future<DataSnapshot>.value(DataSnapshot(value: null)));
    //   final widget = GroupHomePage(title: 'Test', databaseReference: mockRef, myGroup: {'members': {'member1': true}});
    //
    //   // Act
    //   final result = await widget.createState().getEventList();
    //
    //   // Assert
    //   expect(result, isEmpty);
    });
  });

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  test("unit test example", () {
    var widget = HomeScreen();
    widget.createElement();
    expect(widget, "Test");
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
