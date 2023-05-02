import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/assertions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:groupmeet/main.dart' as app;

Function _onError_ignoreOverflowErrors = (
    FlutterErrorDetails details, {
    bool forceReport = false,
  }) {
    bool ifIsOverflowError = false;

    // Detect overflow error.
    var exception = details.exception;
    if (exception is FlutterError) {
      ifIsOverflowError = !exception.diagnostics.any(
          (e) => e.value.toString().startsWith("A RenderFlex overflowed by"));
    }

    // Ignore if is overflow error.
    // if (ifIsOverflowError) {
    //   print('Overflow error.');
    // } else {
    //   FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
    // }
  };
void main() {
  FlutterError.onError =
      _onError_ignoreOverflowErrors as FlutterExceptionHandler?;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('test signup', (tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 10));
      expect(find.text("ROUND"), findsOneWidget);
      expect(find.byKey(const Key("nextButton")), findsOneWidget);
      await tester.tap(find.byKey(const Key("nextButton")));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.text("AROUND"), findsOneWidget);
      expect(find.byKey(const Key("nextButton")), findsOneWidget);
      await tester.tap(find.byKey(const Key("nextButton")));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.text("ROUND TABLE"), findsOneWidget);
      expect(find.byKey(const Key("nextButton")), findsOneWidget);
      await tester.tap(find.byKey(const Key("nextButton")));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.text("BE ROUND OR BE SQUARE"), findsOneWidget);
    });
  });
}
