import 'package:groupmeet/group/group_creation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';
// import 'package:mockito/annotations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_test/flutter_test.dart';
// import './mock.dart'; // from: https://github.com/FirebaseExtended/flutterfire/blob/master/packages/firebase_auth/firebase_auth/test/mock.dart

// import 'package:mockito/mockito.dart';
// import 'package:firebase_database/firebase_database.dart';


void main() {
  FirebaseDatabase firebaseDatabase;
  String? userId = 'YHrs4PbqEKOentDPS5pOHnA6sp82';
  firebaseDatabase = MockFirebaseDatabase.instance;

// var groupCreate = const GroupCreation();


// initial look tests
 testWidgets('MyWidget has a title', (tester) async {
    Widget groupCreationtestWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: GroupCreation(userID: userId, firebaseDatabase: firebaseDatabase,))
    );
    await tester.pumpWidget(groupCreationtestWidget);
    // final GroupCreationState groupCreationState = tester.state(find.byType(GroupCreation));
     final titleFinder = find.text('Get Around');
     expect(titleFinder, findsOneWidget);

  });

  testWidgets('MyWidget has group name input area', (tester) async {
    Widget groupCreationtestWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: GroupCreation(userID: userId, firebaseDatabase: firebaseDatabase,))
    );
    await tester.pumpWidget(groupCreationtestWidget);
    // final GroupCreationState groupCreationState = tester.state(find.byType(GroupCreation));
     final groupNameInput = find.text("Group Name");

     expect(groupNameInput, findsNWidgets(1));

  });

   testWidgets('MyWidget has Emoji input area', (tester) async {        
    Widget groupCreationtestWidget =  MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: GroupCreation(userID: userId,firebaseDatabase: firebaseDatabase,))
    );
    await tester.pumpWidget(groupCreationtestWidget);
    // final GroupCreationState groupCreationState = tester.state(find.byType(GroupCreation));
     final emojiInput = find.text("Emoji");

     expect(emojiInput, findsNWidgets(1));

  });


// // within context - needs the firebase authentication current userId
// //pass in realtime datbase to groupCreation instead of it being called within the function?

     testWidgets('attempt to create Group when not logged in', (tester) async {
      // button press - when userId is null - should have PlatformText with the error message      
       Widget groupCreationtestWidget =  MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: GroupCreation(userID: userId,firebaseDatabase: firebaseDatabase,))
    );
    await tester.pumpWidget(groupCreationtestWidget);

    // await tester.enterText(find.text('Group Name'), 'testing group Name');
    // await tester.enterText(find.text("Emoji"), "🤣");
    await tester.tap(find.byType(PlatformIconButton));
// won't get whoops until the group iformation is entered
    await tester.pump();
    expect(find.text('Please enter a group name and 1 character emoji. You may optionally select a non-default color'), findsOneWidget);

     });
}
