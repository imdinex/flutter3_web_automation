import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flut_autumn_demo/main.dart' as app;

void main() {
  //confirms that the integration_test package is properly initialised before we execute tests
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  //testWidget methods to follow below

  group('sanity test', () {
    testWidgets(
        'Verify login functionality by entering correct username, password and then tapping Login button',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final emailText = find.byKey(const ValueKey('unameField'));
      final passText = find.byKey(const ValueKey('passField'));
      final loginBtn = find.byKey(const ValueKey('loginField'));

      //Verify if email and password is entered before tapping Login button
      await tester.tap(emailText);
      await tester.enterText(emailText, 'test@email.com');

      expect(find.text('test@email.com'), findsOneWidget);

      await tester.tap(passText);
      await tester.enterText(passText, 'demo@1234');

      expect(find.text('demo@1234'), findsOneWidget);

      //Tap on login button and verify login succesful

      await tester.tap(loginBtn);
      await tester.pumpAndSettle();

      expect(find.text('Login'), findsOneWidget);
    });
  });
}
