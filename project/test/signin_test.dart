import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:groupmeet/onboarding/signin.dart';
// import 'package:flutter_platform_widgets';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:mock_exceptions/mock_exceptions.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  setupFirebaseMocks();
  FirebaseDatabase firebaseDatabase;

  var fakeData = {
    'users': {
      'YHrs4PbqEKOentDPS5pOHnA6sp82': {
        'groupIds': {
          '-NStkS14Cj-_CDlqRUxC': true,
          '-NSxq2rKNNWX4rpFkES6': true
        },
        "firstName": "first",
        "lastName": "last",
        "email": "email@email.com",
        "messages_name": "mess",
        "discord": false,
        "facebook": false,
        "instagram": false,
        "messages": false,
        "snapchat": false
      }
    },
    'groups': {
      'NStkS14Cj-_CDlqRUxC': {
        'admin': 'YHrs4PbqEKOentDPS5pOHnA6sp82',
        'color': 4289665855,
        'emoji': "😎",
        'members': {'YHrs4PbqEKOentDPS5pOHnA6sp82': true},
        'check': 'check-vv'
      }
    }
  };
  MockFirebaseDatabase.instance.ref().set(fakeData);

  firebaseDatabase = MockFirebaseDatabase.instance;
  final user = MockUser(
    isAnonymous: false,
    uid: 'YHrs4PbqEKOentDPS5pOHnA6sp82',
    email: 'email@email.com',
    displayName: 'Bob',
  );

  final auth = MockFirebaseAuth(signedIn: false, mockUser: user);

  late NavigatorObserver mockObserver = MockNavigatorObserver();
  Future<void> buildSignInPage(
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(
      home: SignIn(
        firebaseDatabase: firebaseDatabase,
        firebaseAuth: auth,
      ),

      // This mocked observer will now receive all navigation events
      navigatorObservers: [mockObserver],
    ));
  }

  testWidgets("enter no email and password", (WidgetTester tester) async {
    await buildSignInPage(tester);
    await tester.enterText(
        find.byKey(const Key("emailInputAreaSignInKey")), "");
    await tester.enterText(
        find.byKey(
          const Key("passwordInputAreaSignInKey"),
        ),
        "");
        

    await tester.tap(find.byType(PlatformIconButton));
    await tester.pump();
    expect(find.text("Email and Password must not be empty!"), findsOneWidget);
        

  });

  testWidgets("login successfully", (WidgetTester tester) async {
    await buildSignInPage(tester);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    // expect(tester.widget(find.byType(SignIn)), findsOneWidget); //failing because it's not a statefull widget? - but also causing home navigation expectation test to fail....?
    await tester.enterText(
        find.byKey(const Key("emailInputAreaSignInKey")), "email@email.com");
    await tester.enterText(
        find.byKey(
          const Key("passwordInputAreaSignInKey"),
        ),
        "password");
    await tester.pump();
    expect(
      auth.currentUser,
      isNull,
    );
    await tester.tap(find.byType(PlatformIconButton));
    await tester.pump();
    expect(auth.currentUser, isNotNull);
    //TODO: sees that user is logged in successfully, but not checking for navigation to homescreen 'cause IDK how to do that right now
  });

  testWidgets("login attempt with invalid email", (WidgetTester tester) async {
    await buildSignInPage(tester);
    whenCalling(Invocation.method(#signInWithEmailAndPassword, null))
    .on(auth)
    .thenThrow(FirebaseAuthException(code: "user-not-found"));
    
    await tester.enterText(find.byKey(const Key("emailInputAreaSignInKey")),
        "email@email.com");
    await tester.enterText(find.byKey(const Key("passwordInputAreaSignInKey"),),
        "password");    
    await tester.tap(find.byType(PlatformIconButton));
    await tester.pump();
    expect(
      auth.currentUser,
      isNull,
    ); 
    // expect(find.text("Email and Password must not be empty!"), findsOneWidget);
    expect(find.text("Invalid email address."), findsOneWidget);    
  });

    testWidgets("login attempt with invalid password", (WidgetTester tester) async {
    await buildSignInPage(tester);
    whenCalling(Invocation.method(#signInWithEmailAndPassword, null))
    .on(auth)
    .thenThrow(FirebaseAuthException(code: "wrong-password"));
    
 
    await tester.enterText(find.byKey(const Key("emailInputAreaSignInKey")),
        "email@email.com");
    await tester.enterText(find.byKey(const Key("passwordInputAreaSignInKey"),),
        "password");    
    await tester.tap(find.byType(PlatformIconButton));
    await tester.pump();
    expect(
      auth.currentUser,
      isNull,
    );     
    expect(find.text("Invalid password."), findsOneWidget);    
  });
}
