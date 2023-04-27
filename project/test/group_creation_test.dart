
import 'package:groupmeet/group/group_creation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/src/circle_color.dart';


void main() {  
  setupFirebaseMocks();
  FirebaseDatabase firebaseDatabase;
  String? userId = 'YHrs4PbqEKOentDPS5pOHnA6sp82';  
  
  var fakeData = {
    'users': {
      userId: {
        
      },     
    }
  };
  MockFirebaseDatabase.instance.ref().set(fakeData);
    
  firebaseDatabase = MockFirebaseDatabase.instance;


// initial look tests
 testWidgets('MyWidget has a title', (tester) async {    
    Widget groupCreationtestWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: GroupCreation(userID: userId, firebaseDatabase: firebaseDatabase,))
    );
    await tester.pumpWidget(groupCreationtestWidget);
     final titleFinder = find.text('NEW CIRCLE');
     expect(titleFinder, findsOneWidget);

  });

   testWidgets('MyWidget has icon', (tester) async {
    Widget groupCreationtestWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: GroupCreation(userID: userId, firebaseDatabase: firebaseDatabase,))
    );
    await tester.pumpWidget(groupCreationtestWidget);

     expect(find.image(const AssetImage('images/AddPhoto.png'))
     , findsOneWidget);    
  });

  testWidgets('MyWidget has submit image', (tester) async {
    Widget groupCreationtestWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: GroupCreation(userID: userId, firebaseDatabase: firebaseDatabase,))
    );
    await tester.pumpWidget(groupCreationtestWidget);         
     expect(find.image(const AssetImage('images/OnboardingNext.png'))
     , findsOneWidget);    
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
     final emojiInput = find.text("Emoji");

     expect(emojiInput, findsNWidgets(1));

  });




     testWidgets('groupCreation error message when no group information is entered', (tester) async {
       Widget groupCreationtestWidget =  MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: GroupCreation(userID: userId,firebaseDatabase: firebaseDatabase,))
    );
    await tester.pumpWidget(groupCreationtestWidget);
    
    await tester.tap(find.byType(PlatformIconButton));
    await tester.pump();
    expect(find.text('Please enter a group name and 1 character emoji. You may optionally select a non-default color'.toUpperCase()), findsOneWidget);

     });


testWidgets('log in error message appears when userId is not logged in', (tester) async {
  Widget groupCreationtestWidget =  MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: GroupCreation(userID: null,firebaseDatabase: firebaseDatabase,))
    );
    await tester.pumpWidget(groupCreationtestWidget);

    await tester.enterText(find.bySemanticsLabel('Group Name'), 'testing group Name');    
    await tester.enterText(find.bySemanticsLabel("Emoji"), "🤣");
    await tester.tap(find.byType(PlatformIconButton));
    await tester.pump();

    expect(find.text('You are not logged in. Log back in or check your internet connection'.toUpperCase()), findsOneWidget);
});

testWidgets('Group Creation has color picker', (tester) async {
  Widget groupCreationtestWidget =  MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: GroupCreation(userID: userId,firebaseDatabase: firebaseDatabase,))
    );
    await tester.pumpWidget(groupCreationtestWidget);

    await tester.tap(find.byKey(const Key('colorChooserGestureDetector')));
    await tester.pump();    
    expect(find.text('Color Picker'.toUpperCase()), findsOneWidget);
    
});

testWidgets('Group Creation click cancel button', (tester) async {
  Widget groupCreationtestWidget =  MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: GroupCreation(userID: userId,firebaseDatabase: firebaseDatabase,))
    );
    await tester.pumpWidget(groupCreationtestWidget);

    await tester.tap(find.byKey(const Key('colorChooserGestureDetector')));
    await tester.pump();    
    expect(find.text('Color Picker'.toUpperCase()), findsOneWidget);

    await tester.tap(find.text('Cancel'.toUpperCase()));
    await tester.pump();

    expect(find.text('Get Around'.toUpperCase()), findsOneWidget);
    
});

testWidgets('Group Creation click submit button after choosing white', (tester) async {
  Widget groupCreationtestWidget =  MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: GroupCreation(userID: userId,firebaseDatabase: firebaseDatabase,))
    );
    await tester.pumpWidget(groupCreationtestWidget);

    await tester.tap(find.byKey(const Key('colorChooserGestureDetector')));
    await tester.pump();    
    expect(find.text('Color Picker'.toUpperCase()), findsOneWidget);
    
    //choosing white
    await tester.tap(find.byType(CircleColor).at(1));
    await tester.tap(find.text('Submit'.toUpperCase()));
    await tester.pump();

    expect(find.text('Get Around'.toUpperCase()), findsOneWidget);
    
});

testWidgets('Group Creation create group and submit successfully', (tester) async {
    // firebaseDatabase = MockFirebaseDatabase.instance;         
    Widget groupCreationtestWidget =  
          
        MaterialApp(home: GroupCreation(userID: userId,firebaseDatabase: firebaseDatabase,));
      
    await tester.pumpWidget(groupCreationtestWidget);

    await tester.enterText(find.bySemanticsLabel('Group Name'), 'test-vv');    
    await tester.enterText(find.bySemanticsLabel("Emoji"), "🤣");

    await tester.tap(find.byType(PlatformIconButton));
    await tester.pump();  


    // check that groups has the new group within the database
      // find the key of the new group after matching name: 'test-vv' and emoji
      // 
    // check that user has the new group informationi as well (group:id: true)
    DatabaseReference check = firebaseDatabase.ref().child('users').child(userId);    
    var  snap = await check.once();
    
    // for (var element in snap.snapshot.children) {print(element.value.);}

    print(snap.snapshot.children.first.children.first.key);  //{groupIds: {-NT32_plAG6w9cV2ydBg: true}}
    
    DatabaseReference asdf = firebaseDatabase.ref().child('groups');
    var xcv = await asdf.once();
    print(xcv.snapshot.children.first.key);

    expect(snap.snapshot.children.first.children.first.key, xcv.snapshot.children.first.key);

  // {-NT331wnem4vPzygItzp: {name: test-vv, emoji: 🤣, admin: YHrs4PbqEKOentDPS5pOHnA6sp82, members: {YHrs4PbqEKOentDPS5pOHnA6sp82: true}, color: 4283513819}}
    for (var element in xcv.snapshot.children.first.children) { 
      if(element.key == "name"){
        expect(element.value, "test-vv");
      }else if(element.key == "emoji"){
        expect(element.value, "🤣");
      } else if(element.key == "admin"){
        expect((element.value), userId);
      }

    }});


}
