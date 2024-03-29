
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:groupmeet/onboarding/social_onboarding.dart';
void main(){
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
        "discord": false,
        "facebook": false,
        "instagram": false,
        "messages": false,
        "snapchat": false,
         "discord_name": null,
        "facebook_name": null,
        "instagram_name": null,
        "messages_name": null,
        "snapchat_name": null,
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

  final auth = MockFirebaseAuth();
  final user = MockUser(
    isAnonymous: false,
    uid: 'YHrs4PbqEKOentDPS5pOHnA6sp82',
    email: 'email@email.com',
    displayName: 'Bob',
  );
  
  

    Future<void> buildSocialOnboardingPage(
     
    WidgetTester tester,
  ) async {
        final TestWidgetsFlutterBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(640, 684));
    await tester.pumpWidget(MaterialApp(
      home: SocialOnboarding(
        firebaseDatabase: firebaseDatabase,
        firebaseAuth: auth,
      ),
      

    ));
  }

  testWidgets("social media message is present", (WidgetTester tester) async {    
    await buildSocialOnboardingPage(tester);
    find.text("Save third-party usernames to be used with Round (optional)");

  });



}