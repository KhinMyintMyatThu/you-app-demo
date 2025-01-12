import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_app_demo/controllers/auth_controller.dart';
import 'package:you_app_demo/utils/constants/route_constants.dart';
import 'package:you_app_demo/utils/widgets/back_button_widget.dart';
import 'package:you_app_demo/utils/widgets/button_widget.dart';

import '../utils/widgets/text_form_widget.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leadingWidth: 200,
          leading: BackButtonWidget(
            onTap: () => {
              Get.back(),
            },
          )),
      body: Stack(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextFormWidget(
                    txtHint: 'Enter Username/Email',
                    txtController: _emailController,
                  ),
                  const SizedBox(height: 20),
                  TextFormWidget(
                    txtHint: 'Enter Password',
                    isPassword: true,
                    txtController: _passwordController,
                  ),
                  const SizedBox(height: 20),
                  ButtonWidget(
                    btnTxt: 'Login',
                    onPressed: () => {login(context)},
                  ),
                  const SizedBox(height: 20),
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
                          Get.offNamed(registerRoute);
                        },
                    )
                  ]))
            ],
          ),
        ),
        Obx(() {
          return authController.isLoading.value
              ? Container(
                  color:
                      Colors.black.withOpacity(0.5), // Semi-transparent overlay
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : const SizedBox.shrink(); // Empty container when not loading
        }),
      ]),
    );
  }

  login(context) {
    FocusScope.of(context).unfocus();
    String userInput = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String email = '';
    String username = '';
    (authController.isEmailValid(userInput))
        ? email = userInput
        : username = userInput;
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email/Username and password cannot be empty');
      return;
    }
    authController.login(email, username, password);
  }
}
