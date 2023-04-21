import 'package:firebase_database/firebase_database.dart';
import 'package:groupmeet/group/group_creation.dart';
import 'package:groupmeet/home.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:groupmeet/code/code_reception.dart';
import 'package:groupmeet/settings/settings.dart';
class MockNavigatorObserver extends Mock implements NavigatorObserver {}
class MockFirebaseDatabaseV extends Mock implements MockFirebaseDatabase {
  static FirebaseDatabase get instance => MockFirebaseDatabase();

  Stream<DatabaseEvent> onValue() {
  return const Stream.empty();         
    }
      
}
void main(){
  setupFirebaseMocks();
  FirebaseDatabase firebaseDatabase;  
  // FirebaseDatabase.instance.ref("users/${userID!}/groupIds").onValue.listen((event) async {
  // final groupInfo = await FirebaseDatabase.instance.ref("groups/$groupIDCasted/").get();
  var fakeData = {
    'users':{
      'YHrs4PbqEKOentDPS5pOHnA6sp82':{
        'groupIds':{
          '-NStkS14Cj-_CDlqRUxC' : true,
          '-NSxq2rKNNWX4rpFkES6' : true
        }, 
        "firstName" : "first",
        "lastName" : "last",
        "email" : "email@email.com",
        "messages_name" : "mess",        
        "discord" : false,
        "facebook" : false,
        "instagram" : false,
        "messages" : false,
        "snapchat" : false
      }
    },
    'groups' :{
      'NStkS14Cj-_CDlqRUxC' : {
        'admin' : 'YHrs4PbqEKOentDPS5pOHnA6sp82', 
        'color' : 4289665855, 
        'emoji' : "😎", 
        'members' : {
          'YHrs4PbqEKOentDPS5pOHnA6sp82' : true
        }, 
        'check' : 'check-vv'
      }
    }
  };
  MockFirebaseDatabaseV.instance.ref().set(fakeData);

  firebaseDatabase = MockFirebaseDatabaseV.instance;
   final user = MockUser(
      isAnonymous: false,
      uid: 'YHrs4PbqEKOentDPS5pOHnA6sp82',
      email: 'v@gmail.com',
      displayName: 'Bob',
    );
    final auth = MockFirebaseAuth(signedIn: true,mockUser: user);
    
    
  group('navigation tests', () {
    late NavigatorObserver mockObserver = MockNavigatorObserver();
    

    Future<void> buildHomePage(WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomeScreen(firebaseDatabase: firebaseDatabase,firebaseAuth: auth,),

        // This mocked observer will now receive all navigation events
        // that happen in our app.
        navigatorObservers: [mockObserver],
      ));

      // The tester.pumpWidget() call above just built our app widget
      // and triggered the pushObserver method on the mockObserver once.      
    }

    Future<void> navigateToGroupCreationPage(WidgetTester tester) async {
      // Tap the button which should navigate to the details page.
      await tester.tap(find.byKey(const Key("navigatetoGroupCreationPageButton")));
      await tester.pumpAndSettle();
    }

    Future<void> navigateToCodeReceptionPage(WidgetTester tester) async {
      await tester.tap(find.byKey(const Key("navigatetoCodeReceptionPageButton")));
      await tester.pumpAndSettle();
    }

    Future<void> navigateToSettingsPage(WidgetTester tester) async {
      // Tap the button which should navigate to the details page.
      await tester.tap(find.byKey(const Key("navigatetoSettingsPageButton")));
      await tester.pumpAndSettle();
    }


    testWidgets(
        'when tapping "group creation" button, should navigate to group creation page',
        (WidgetTester tester) async {
      await buildHomePage(tester);
      await navigateToGroupCreationPage(tester);

         expect(find.byType(GroupCreation), findsOneWidget);
         expect(find.text('Get Around'), findsOneWidget);
    });

    testWidgets('when tapping on QR button, should navigate to code reception page', 
    (widgetTester) async{
      await buildHomePage(widgetTester);
      await navigateToCodeReceptionPage(widgetTester);

      expect(find.byType(CodeReception), findsOneWidget);
      expect(find.text("Joining Group Options"), findsOneWidget);            
    });

    testWidgets("when tapping settings page, should navigate to settings page",
     (widgetTester) async{
      await buildHomePage(widgetTester);
      await navigateToSettingsPage(widgetTester);

      expect(find.byType(Settings), findsOneWidget);
      // expect(find.text('Settings'), findsOneWidget);

    });

});

}
