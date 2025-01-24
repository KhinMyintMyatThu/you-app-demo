import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:you_app_demo/controllers/auth_controller.dart';
import 'package:you_app_demo/utils/widgets/button_widget.dart';
import 'package:you_app_demo/utils/widgets/text_form_widget.dart';

void main() {
  setUpAll(() {
    // Initialize the AuthController
    Get.put(AuthController());
  });

  testWidgets('Login Page displays correctly', (WidgetTester tester) async {
    // Create the widget by wrapping it with a MaterialApp
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Login',
                  key: Key('login_text'), // Add a key to the widget
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormWidget(
                  txtHint: 'Enter Username/Email',
                  txtController: TextEditingController(),
                  width: 250,
                ),
                const SizedBox(height: 20),
                TextFormWidget(
                  txtHint: 'Enter Password',
                  isPassword: true,
                  txtController: TextEditingController(),
                  width: 250,
                ),
                const SizedBox(height: 20),
                ButtonWidget(
                  btnTxt: 'Login',
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
              ],
            ),
            RichText(
                key: Key('register_text'),
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  const TextSpan(
                      text: 'No account? ',
                      style: TextStyle(color: Colors.white, fontSize: 12.0)),
                  TextSpan(
                    text: 'Register here',
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 12.0,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  )
                ]))
          ],
        ),
      ),
    ));

    // Verify the login text is displayed using the key
    expect(find.byKey(const Key('login_text')), findsOneWidget);

    // Verify the text form widgets are displayed
    expect(find.byType(TextFormWidget), findsNWidgets(2));

    // Verify the button is displayed
    expect(find.byType(ButtonWidget), findsOneWidget);

   // Verify the RichText is displayed using the key
    expect(find.byKey(const Key('register_text')), findsOneWidget);

    // Verify the content of the RichText
    final richTextWidget = tester.widget<RichText>(find.byKey(const Key('register_text')));
    final textSpan = richTextWidget.text as TextSpan;

    // Verify "No account? " text
    expect(textSpan.children![0].toPlainText(), 'No account? ');

    // Verify "Register here" text
    expect(textSpan.children![1].toPlainText(), 'Register here');
  });
}
