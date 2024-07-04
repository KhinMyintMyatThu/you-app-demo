import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:you_app_demo/utils/constants/route_constants.dart';
import 'package:you_app_demo/utils/widgets/button_widget.dart';

import '../../utils/widgets/back_button_widget.dart';
import '../../utils/widgets/text_form_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: const BackButtonWidget(),
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
                  'Register',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormWidget(txtHint: 'Enter Email'),
                SizedBox(height: 20),
                TextFormWidget(txtHint: 'Enter Username'),
                SizedBox(height: 20),
                TextFormWidget(
                  txtHint: 'Create Password',
                  isPassword: true,
                ),
                SizedBox(height: 20),
                TextFormWidget(
                  txtHint: 'Confrim Password',
                  isPassword: true,
                ),
                SizedBox(height: 20),
                ButtonWidget(btnTxt: 'Register'),
                SizedBox(height: 20),
              ],
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  const TextSpan(
                      text: 'Have an Account? ',
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

