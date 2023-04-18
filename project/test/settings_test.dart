import 'package:flutter/widgets.dart';
import 'package:groupmeet/onboarding/signup.dart';
import 'package:groupmeet/settings/settings.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main(){
  setupFirebaseMocks();
  FirebaseDatabase firebaseDatabase;  

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
  MockFirebaseDatabase.instance.ref().set(fakeData);
  firebaseDatabase = MockFirebaseDatabase.instance;

   final user = MockUser(
      isAnonymous: false,
      uid: 'YHrs4PbqEKOentDPS5pOHnA6sp82',
      email: 'v@gmail.com',
      displayName: 'Bob',
    );
    final auth = MockFirebaseAuth(signedIn: true,mockUser: user);
  
      Future<void> buildSettingsPage(WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Settings(firebaseDatabase: firebaseDatabase,firebaseAuth: auth,),
        
      ));
      }
    testWidgets(
        'able to edit profile successfully',
        (WidgetTester tester) async {
          await buildSettingsPage(tester);
        // button calls editProfile
        await  tester.tap(find.byKey(const Key("editProfileButtonKey")));

        await tester.pump();

        await tester.enterText(find.byKey(const Key("editNameArea")), "edited name");

        await tester.enterText(find.byKey(const Key("editEmailArea")), "new Email");

        await tester.tap(find.text("Save"));
        await tester.pump();
        expect(find.text("edited name"), findsOneWidget);
        expect(find.text("new Email"), findsOneWidget);        
         
    });

    // TODO: click cancel after editing -


// TODO: not finding the signing gesture detector for some reason?
    // testWidgets("signing out", (WidgetTester tester) async {
      
    //   await buildSettingsPage(tester);
    //   await tester.pumpAndSettle();
    //   await tester.tap(find.byKey( const Key("signOutSettingsGestureDetectorKey")));

    //   // await widgetTester.tap(
    //   //   find.descendant(of: find.byKey(const Key("paddingsignOutSettingsGestureDetectorKey")) , matching: find.byKey( const Key("signOutSettingsGestureDetectorKey"))));
      
    //   await tester.pump();

    //   expect(find.byType(SignUp), findsOneWidget);

    // });

    testWidgets("adding a phone number changes the opacity of the widget", (WidgetTester tester) async{
      await buildSettingsPage(tester);
      await tester.tap(find.byKey(const Key("smsAppGestureKey")));

      await tester.pump();
      //  opacity first should be 0.4 here
      expect(tester.widget(find.byKey(const Key("smsAppOpacityKey"))),
       isA<ColorFiltered>().having((p0) => p0.colorFilter, "new opacity", ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.srcATop) ));
      // entering phone number here
      await tester.enterText(find.byKey(const Key("newSocialEditPlatformAlertKey")), "7688-567-1234");
      // saving phone number
      await tester.tap(find.byKey(const Key("saveNewSocialTapKey")));
      await tester.pump();
      await tester.pumpAndSettle();
      
   
       expect(tester.widget(find.byKey(const Key("smsAppOpacityKey"))),
       isA<ColorFiltered>().having((p0) => p0.colorFilter, "new opacity", ColorFilter.mode(Colors.black.withOpacity(0.0), BlendMode.srcATop) ));
});
    
  testWidgets("adding snap info changes the opacity of the widget", (WidgetTester tester) async{
      await buildSettingsPage(tester);
      await tester.tap(find.byKey(const Key("snapAppGestureKey")));

      await tester.pump();
      //  opacity first should be 0.4 here
      expect(tester.widget(find.byKey(const Key("snapAppOpacityKey"))),
       isA<ColorFiltered>().having((p0) => p0.colorFilter, "new opacity", ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.srcATop) ));
      // entering phone number here
      await tester.enterText(find.byKey(const Key("newSocialEditPlatformAlertKey")), "snapUserName");
      // saving phone number
      await tester.tap(find.byKey(const Key("saveNewSocialTapKey")));
      await tester.pump();
      await tester.pumpAndSettle();
      
   
       expect(tester.widget(find.byKey(const Key("snapAppOpacityKey"))),
       isA<ColorFiltered>().having((p0) => p0.colorFilter, "new opacity", ColorFilter.mode(Colors.black.withOpacity(0.0), BlendMode.srcATop) ));
});

  testWidgets("adding discord info changes the opacity of the widget", (WidgetTester tester) async{
      await buildSettingsPage(tester);
      await tester.tap(find.byKey(const Key("discordAppGestureKey")));

      await tester.pump();
      //  opacity first should be 0.4 here
      expect(tester.widget(find.byKey(const Key("discordAppOpacityKey"))),
       isA<ColorFiltered>().having((p0) => p0.colorFilter, "new opacity", ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.srcATop) ));
      // entering phone number here
      await tester.enterText(find.byKey(const Key("newSocialEditPlatformAlertKey")), "snapUserName");
      // saving phone number
      await tester.tap(find.byKey(const Key("saveNewSocialTapKey")));
      await tester.pump();
      await tester.pumpAndSettle();
      
   
       expect(tester.widget(find.byKey(const Key("discordAppOpacityKey"))),
       isA<ColorFiltered>().having((p0) => p0.colorFilter, "new opacity", ColorFilter.mode(Colors.black.withOpacity(0.0), BlendMode.srcATop) ));
});

 testWidgets("adding facebook info changes the opacity of the widget", (WidgetTester tester) async{
      await buildSettingsPage(tester);
      await tester.tap(find.byKey(const Key("facebookAppGestureKey")));

      await tester.pump();
      //  opacity first should be 0.4 here
      expect(tester.widget(find.byKey(const Key("facebookAppOpacityKey"))),
       isA<ColorFiltered>().having((p0) => p0.colorFilter, "new opacity", ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.srcATop) ));
      // entering phone number here
      await tester.enterText(find.byKey(const Key("newSocialEditPlatformAlertKey")), "snapUserName");
      // saving phone number
      await tester.tap(find.byKey(const Key("saveNewSocialTapKey")));
      await tester.pump();
      await tester.pumpAndSettle();
      
   
       expect(tester.widget(find.byKey(const Key("facebookAppOpacityKey"))),
       isA<ColorFiltered>().having((p0) => p0.colorFilter, "new opacity", ColorFilter.mode(Colors.black.withOpacity(0.0), BlendMode.srcATop) ));
});

testWidgets("adding instagram info changes the opacity of the widget", (WidgetTester tester) async{
      await buildSettingsPage(tester);
      await tester.tap(find.byKey(const Key("instagramAppGestureKey")));

      await tester.pump();
      //  opacity first should be 0.4 here
      expect(tester.widget(find.byKey(const Key("instagramAppOpacityKey"))),
       isA<ColorFiltered>().having((p0) => p0.colorFilter, "new opacity", ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.srcATop) ));
      // entering phone number here
      await tester.enterText(find.byKey(const Key("newSocialEditPlatformAlertKey")), "snapUserName");
      // saving phone number
      await tester.tap(find.byKey(const Key("saveNewSocialTapKey")));
      await tester.pump();
      await tester.pumpAndSettle();
      
   
       expect(tester.widget(find.byKey(const Key("instagramAppOpacityKey"))),
       isA<ColorFiltered>().having((p0) => p0.colorFilter, "new opacity", ColorFilter.mode(Colors.black.withOpacity(0.0), BlendMode.srcATop) ));
});


}


  //  var snapshot = await firebaseDatabase.ref("users/YHrs4PbqEKOentDPS5pOHnA6sp82").get();
  //     for (var element in snapshot.children) {
  //       print("${element.key} and ${element.value}" );
  //     }




  // testing to make sure only a phone number number is accepted - right now taking any value
    // testing for the length of the phone number