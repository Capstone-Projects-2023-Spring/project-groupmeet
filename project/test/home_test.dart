import 'package:firebase_database/firebase_database.dart';
import 'package:groupmeet/group/group_creation.dart';
import 'package:groupmeet/home.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:groupmeet/settings/settings.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockFirebaseDatabaseV extends Mock implements MockFirebaseDatabase {
  static FirebaseDatabase get instance => MockFirebaseDatabase();

  Stream<DatabaseEvent> onValue() {
    return const Stream.empty();
  }
}

void main() {
  setupFirebaseMocks();
  FirebaseDatabase firebaseDatabase;
  // FirebaseDatabase.instance.ref("users/${userID!}/groupIds").onValue.listen((event) async {
  // final groupInfo = await FirebaseDatabase.instance.ref("groups/$groupIDCasted/").get();
  var fakeData = {
    'users': {
      'YHrs4PbqEKOentDPS5pOHnA6sp82': {
        'groupIds': {
          '-NStkS14Cj-_CDlqRUxC': true,
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
      '-NStkS14Cj-_CDlqRUxC': {
        'admin': 'YHrs4PbqEKOentDPS5pOHnA6sp82',
        'color': 4289665855,
        'emoji': "😎",
        'members': {'YHrs4PbqEKOentDPS5pOHnA6sp82': true},
        'name': 'check-vv'
      },
      '-NUBnwU0pAWO4JTMlLCw': {
        "admin": "kBqgZhe0uIajVQTjyotOfAPPSXG3",
        "color": 4283513819,
        "emoji": "🙂",
        "members": {
          "kBqgZhe0uIajVQTjyotOfAPPSXG3": true,
        },
        "name": "newGroup"
      }
    }
  };
  group('navigation tests', () {
    late NavigatorObserver mockObserver = MockNavigatorObserver();

    Future<void> buildHomePage(WidgetTester tester) async {
      MockFirebaseDatabaseV.instance.ref().set(fakeData);
      firebaseDatabase = MockFirebaseDatabaseV.instance;

      final user = MockUser(
        isAnonymous: false,
        uid: 'YHrs4PbqEKOentDPS5pOHnA6sp82',
        email: 'v@gmail.com',
        displayName: 'Bob',
      );
      final auth = MockFirebaseAuth(signedIn: true, mockUser: user);
      await tester.pumpWidget(MaterialApp(
        home: HomeScreen(
          firebaseDatabase: firebaseDatabase,
          firebaseAuth: auth,
        ),

        // This mocked observer will now receive all navigation events
        // that happen in our app.
        navigatorObservers: [mockObserver],
      ));

      // The tester.pumpWidget() call above just built our app widget
      // and triggered the pushObserver method on the mockObserver once.
    }

    Future<void> navigateToGroupCreationPage(WidgetTester tester) async {
      // Tap the button which should navigate to the details page.
      await tester
          .tap(find.byKey(const Key("navigatetoGroupCreationPageButton")));
      await tester.pumpAndSettle();
    }

    Future<void> navigateToCodeReceptionPage(WidgetTester tester) async {
      await tester
          .tap(find.byKey(const Key("navigatetoCodeReceptionPageButton")));
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
      expect(find.text('GET AROUND'), findsOneWidget);
    });

    testWidgets('test code page on home screen', (WidgetTester tester) async {
      await buildHomePage(tester);
      await navigateToCodeReceptionPage(tester);

      expect(find.text('ENTER ID'), findsOneWidget);
      expect(find.text('SCAN QR CODE'), findsOneWidget);
      expect(find.text('CANCEL'), findsOneWidget);
    });

    testWidgets("when tapping settings page, should navigate to settings page",
        (widgetTester) async {
      await buildHomePage(widgetTester);
      await navigateToSettingsPage(widgetTester);

      expect(find.byType(Settings), findsOneWidget);
    });

// THIS ONE STILL FAILING.....
    testWidgets("entering group Id and pressing Ok should result in an group icon",
        (widgetTester) async {
      await buildHomePage(widgetTester);
      await navigateToCodeReceptionPage(widgetTester);
      await widgetTester.tap(find.text('ENTER ID'));

      await widgetTester.pump();
      expect(find.text("newGroup"), findsNothing);
      await widgetTester.enterText(
          find.byKey(const Key("enterGroupIdToJoinKey")),
          "-NUBnwU0pAWO4JTMlLCw");

      await widgetTester.tap(find.byKey(const Key("OKButtonForNewGroupIdKey")));
      await widgetTester.pump();
      expect(find.text("CHECK-VV"), findsOneWidget);
    });
  });
}
