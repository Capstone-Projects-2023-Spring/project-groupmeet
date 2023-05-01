
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
import 'package:groupmeet/onboarding/signup.dart';
import 'package:groupmeet/calendar/calendar_selection.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main(){
  setupFirebaseMocks();
  FirebaseDatabase firebaseDatabase;
  firebaseDatabase = MockFirebaseDatabase.instance;

    var fakeData = {
    'users': {      
    },
    'groups': {
    }
  };

  MockFirebaseDatabase.instance.ref().set(fakeData);
  final auth = MockFirebaseAuth();
  late NavigatorObserver mockObserver = MockNavigatorObserver();

  Future<void> buildSignUpPage(
    WidgetTester tester,
  ) async {
    final TestWidgetsFlutterBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(640, 680));
    await tester.pumpWidget(MaterialApp(
      home: SignUp(
        firebaseDatabase: firebaseDatabase,
        firebaseAuth: auth,
      ),

      // This mocked observer will now receive all navigation events
      navigatorObservers: [mockObserver],
    ));
  }
  testWidgets("full name not entered", (WidgetTester tester) async{    
    await buildSignUpPage(tester);
    await tester.enterText(find.byKey(const Key("EnterFullNameInputKey")), "singleName");
    await tester.enterText(find.byKey(const Key("signUpEnterEmailInputKey"),), "email@gmail.com");
    await tester.enterText(find.byKey(const Key("signUpPasswordKey")), "password");

    await tester.tap(find.byKey(const Key("signUpButtonAndGoToCalendarLinkingPageKey")));
    await tester.pump();

    expect(find.text("PLEASE ENTER A FULL FIRST AND LAST NAME, EMAIL, AND PASSWORD"), findsOneWidget);
    
  });


  testWidgets("successfully creating profile and navigating to calendar selection page", (WidgetTester tester) async{    
    await buildSignUpPage(tester);

    await tester.enterText(find.byKey(const Key("EnterFullNameInputKey")), "first last");
    await tester.enterText(find.byKey(const Key("signUpEnterEmailInputKey"),), "email@gmail.com");
    await tester.enterText(find.byKey(const Key("signUpPasswordKey")), "password");

    await tester.tap(find.byKey(const Key("signUpButtonAndGoToCalendarLinkingPageKey")));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.byType(CalendarSelection), findsOneWidget);
  });

  // testWidgets("", (WidgetTester tester) async{   
  //   whenCalling(Invocation.method(#createUserWithEmailAndPassword, null))
  //   .on(auth)
  //   .thenThrow(FirebaseAuthException(code: "wrong-password"));
  //   await buildSignUpPage(tester);

  //   await tester.enterText(find.byKey(const Key("EnterFullNameInputKey")), "first last");
  //   await tester.enterText(find.byKey(const Key("signUpEnterEmailInputKey"),), "email@gmail.com");
  //   await tester.enterText(find.byKey(const Key("signUpPasswordKey")), "password");

  //   await tester.tap(find.byKey(const Key("signUpButtonAndGoToCalendarLinkingPageKey")));
  //   await tester.pumpAndSettle(const Duration(seconds: 2));
  // });
}

