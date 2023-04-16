import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/widgets.dart';
import 'package:groupmeet/group/group_creation.dart';
import 'package:groupmeet/home.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// import 'package:firebase_database/firebase_database.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}
// class MockFirebaseDatabaseV extends Mock implements MockFirebaseDatabase {
//   static FirebaseDatabase get instance => MockFirebaseDatabase();
//   @override
//     Stream<DatabaseEvent> onValue() {
//       DatabaseEvent check;
//       Stream<DatabaseEvent> stream = const Stream.empty();
//       return stream;            
//     }
      
// }
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
        }
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
  MockFirebaseDatabase.instance.ref().set(fakeData);
  firebaseDatabase = MockFirebaseDatabase.instance;
   final user = MockUser(
      isAnonymous: false,
      uid: 'YHrs4PbqEKOentDPS5pOHnA6sp82',
      email: 'v@gmail.com',
      displayName: 'Bob',
    );
    final auth = MockFirebaseAuth(mockUser: user);
    
  group('navigation tests', () {
    late NavigatorObserver mockObserver;

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

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
      //
      // By calling tester.pumpAndSettle(), we ensure that all animations
      // have completed before we continue further.
      await tester.tap(find.byKey(const Key("navigatetoGroupCreationPageButton")));
      await tester.pumpAndSettle();
    }

    testWidgets(
        'when tapping "navigate to details" button, should navigate to details page',
        (WidgetTester tester) async {
      await buildHomePage(tester);
      await navigateToGroupCreationPage(tester);

         expect(find.byType(GroupCreation), findsOneWidget);
         expect(find.text('Get Around'), findsOneWidget);
    });

});

}


// TODO: reason for firebaseDatabase exception:
  // there is No Mock implementation of onValue.listen I think
  // and it seems like this page isn't done being implemented