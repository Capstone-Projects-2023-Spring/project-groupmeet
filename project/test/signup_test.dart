
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:groupmeet/onboarding/signup.dart';

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
    await tester.pumpWidget(MaterialApp(
      home: SignUp(
        firebaseDatabase: firebaseDatabase,
        firebaseAuth: auth,
      ),

      // This mocked observer will now receive all navigation events
      navigatorObservers: [mockObserver],
    ));
  }
  testWidgets("creating user account successfully", (WidgetTester tester) async{
    await buildSignUpPage(tester);
    // render flex exception being thrown
    // unable to proceed rn :(



  });



}