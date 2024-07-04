import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:you_app_demo/utils/constants/route_constants.dart';
import 'package:you_app_demo/utils/widgets/button_widget.dart';

import '../../utils/widgets/text_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 15,
              ),
              Flexible(child: Text('Back')),
            ],
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormWidget(txtHint: 'Enter Username/Email'),
                SizedBox(height: 20),
                TextFormWidget(
                  txtHint: 'Enter Password',
                  isPassword: true,
                ),
                SizedBox(height: 20),
                ButtonWidget(btnTxt: 'Login'),
                SizedBox(height: 20),
              ],
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  const TextSpan(
                      text: 'No account? ',
                      style: TextStyle(color: Colors.black, fontSize: 12.0)),
                  TextSpan(
                    text: 'Register here',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 12.0,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, registerRoute);
                      },
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
