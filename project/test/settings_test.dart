import 'package:groupmeet/settings/settings.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

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

  final user = MockUser(
    isAnonymous: false,
    uid: 'YHrs4PbqEKOentDPS5pOHnA6sp82',
    email: 'v@gmail.com',
    displayName: 'Bob',
  );
  final auth = MockFirebaseAuth(signedIn: true, mockUser: user);

  Future<void> buildSettingsPage(WidgetTester tester) async {
    MockFirebaseDatabase.instance.ref().set(fakeData);
    firebaseDatabase = MockFirebaseDatabase.instance;
    NavigatorObserver mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(MaterialApp(
      home: Settings(
        firebaseDatabase: firebaseDatabase,
        firebaseAuth: auth,
      ),
      navigatorObservers: [mockObserver],
    ));
  }

  testWidgets('able to edit profile successfully', (WidgetTester tester) async {
    await buildSettingsPage(tester);
    // button calls editProfile
    await tester.tap(find.byKey(const Key("editProfileButtonKey")));

    await tester.pump();

    await tester.enterText(
        find.byKey(const Key("editNameArea")), "edited name");

    await tester.enterText(find.byKey(const Key("editEmailArea")), "new Email");

    await tester.tap(find.text("SAVE"));
    await tester.pump();
    expect(find.text("EDITED NAME"), findsOneWidget);
    expect(find.text("NEW EMAIL"), findsOneWidget);
  });

  testWidgets('cancelling after editing profile', (WidgetTester tester) async {
    await buildSettingsPage(tester);
    // button calls editProfile
    await tester.tap(find.byKey(const Key("editProfileButtonKey")));

    await tester.pump();

    await tester.enterText(
        find.byKey(const Key("editNameArea")), "edited name");

    await tester.enterText(find.byKey(const Key("editEmailArea")), "new Email");

    await tester.tap(find.text("CANCEL"));
    await tester.pump();
    expect(find.text("FIRST LAST"), findsOneWidget);
    expect(find.text("EMAIL@EMAIL.COM"), findsOneWidget);
  });

  testWidgets("adding a phone number changes the opacity of the widget",
      (WidgetTester tester) async {
    await buildSettingsPage(tester);
    await tester.tap(find.byKey(const Key("smsAppGestureKey")));

    await tester.pump();
    //  opacity first should be 0.4 here
    expect(
        tester.widget(find.byKey(const Key("smsAppOpacityKey"))),
        isA<ColorFiltered>().having(
            (p0) => p0.colorFilter,
            "new opacity",
            ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.srcATop)));
    // entering phone number here
    await tester.enterText(
        find.byKey(const Key("newSocialEditPlatformAlertKey")),
        "7688-567-1234");
    // saving phone number
    await tester.tap(find.byKey(const Key("saveNewSocialTapKey")));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(
        tester.widget(find.byKey(const Key("smsAppOpacityKey"))),
        isA<ColorFiltered>().having(
            (p0) => p0.colorFilter,
            "new opacity",
            ColorFilter.mode(
                Colors.black.withOpacity(0.0), BlendMode.srcATop)));
  });

  testWidgets("adding snap info changes the opacity of the widget",
      (WidgetTester tester) async {
    await buildSettingsPage(tester);
    await tester.tap(find.byKey(const Key("snapAppGestureKey")));

    await tester.pump();
    //  opacity first should be 0.4 here
    expect(
        tester.widget(find.byKey(const Key("snapAppOpacityKey"))),
        isA<ColorFiltered>().having(
            (p0) => p0.colorFilter,
            "new opacity",
            ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.srcATop)));
    // entering phone number here
    await tester.enterText(
        find.byKey(const Key("newSocialEditPlatformAlertKey")), "snapUserName");
    // saving phone number
    await tester.tap(find.byKey(const Key("saveNewSocialTapKey")));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(
        tester.widget(find.byKey(const Key("snapAppOpacityKey"))),
        isA<ColorFiltered>().having(
            (p0) => p0.colorFilter,
            "new opacity",
            ColorFilter.mode(
                Colors.black.withOpacity(0.0), BlendMode.srcATop)));
  });

  testWidgets("adding discord info changes the opacity of the widget",
      (WidgetTester tester) async {
    await buildSettingsPage(tester);
    await tester.tap(find.byKey(const Key("discordAppGestureKey")));

    await tester.pump();
    //  opacity first should be 0.4 here
    expect(
        tester.widget(find.byKey(const Key("discordAppOpacityKey"))),
        isA<ColorFiltered>().having(
            (p0) => p0.colorFilter,
            "new opacity",
            ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.srcATop)));
    // entering phone number here
    await tester.enterText(
        find.byKey(const Key("newSocialEditPlatformAlertKey")), "snapUserName");
    // saving phone number
    await tester.tap(find.byKey(const Key("saveNewSocialTapKey")));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(
        tester.widget(find.byKey(const Key("discordAppOpacityKey"))),
        isA<ColorFiltered>().having(
            (p0) => p0.colorFilter,
            "new opacity",
            ColorFilter.mode(
                Colors.black.withOpacity(0.0), BlendMode.srcATop)));
  });

  testWidgets("adding facebook info changes the opacity of the widget",
      (WidgetTester tester) async {
    await buildSettingsPage(tester);
    await tester.tap(find.byKey(const Key("facebookAppGestureKey")));

    await tester.pump();
    //  opacity first should be 0.4 here
    expect(
        tester.widget(find.byKey(const Key("facebookAppOpacityKey"))),
        isA<ColorFiltered>().having(
            (p0) => p0.colorFilter,
            "new opacity",
            ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.srcATop)));
    // entering phone number here
    await tester.enterText(
        find.byKey(const Key("newSocialEditPlatformAlertKey")), "snapUserName");
    // saving phone number
    await tester.tap(find.byKey(const Key("saveNewSocialTapKey")));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(
        tester.widget(find.byKey(const Key("facebookAppOpacityKey"))),
        isA<ColorFiltered>().having(
            (p0) => p0.colorFilter,
            "new opacity",
            ColorFilter.mode(
                Colors.black.withOpacity(0.0), BlendMode.srcATop)));
  });

  testWidgets("adding instagram info changes the opacity of the widget",
      (WidgetTester tester) async {
    await buildSettingsPage(tester);
    await tester.tap(find.byKey(const Key("instagramAppGestureKey")));

    await tester.pump();
    //  opacity first should be 0.4 here
    expect(
        tester.widget(find.byKey(const Key("instagramAppOpacityKey"))),
        isA<ColorFiltered>().having(
            (p0) => p0.colorFilter,
            "new opacity",
            ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.srcATop)));
    // entering phone number here
    await tester.enterText(
        find.byKey(const Key("newSocialEditPlatformAlertKey")), "snapUserName");
    // saving phone number
    await tester.tap(find.byKey(const Key("saveNewSocialTapKey")));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(
        tester.widget(find.byKey(const Key("instagramAppOpacityKey"))),
        isA<ColorFiltered>().having(
            (p0) => p0.colorFilter,
            "new opacity",
            ColorFilter.mode(
                Colors.black.withOpacity(0.0), BlendMode.srcATop)));
  });

  testWidgets(
      "clicking cancel after making social media changes and opacity remains the same",
      (WidgetTester tester) async {
    await buildSettingsPage(tester);
    await tester.tap(find.byKey(const Key("instagramAppGestureKey")));

    await tester.pump();
    //  opacity first should be 0.4 here
    expect(
        tester.widget(find.byKey(const Key("instagramAppOpacityKey"))),
        isA<ColorFiltered>().having(
            (p0) => p0.colorFilter,
            "new opacity",
            ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.srcATop)));
    // entering insta information
    await tester.enterText(
        find.byKey(const Key("newSocialEditPlatformAlertKey")), "snapUserName");
    // click cancel
    await tester.tap(find.byKey(const Key("cancelNewSocialTapKey")));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(
        tester.widget(find.byKey(const Key("instagramAppOpacityKey"))),
        isA<ColorFiltered>().having(
            (p0) => p0.colorFilter,
            "new opacity",
            ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.srcATop)));
  });
}
