import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_app_demo/controllers/auth_controller.dart';
import 'package:you_app_demo/utils/constants/route_constants.dart';
import 'package:you_app_demo/utils/constants/widget_constants.dart';
import 'package:you_app_demo/utils/widgets/button_widget.dart';
import '../utils/widgets/back_button_widget.dart';
import '../utils/widgets/text_form_widget.dart';

class RegisterPage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController pwdCtrl = TextEditingController();
  final TextEditingController confrirmPwdCtrl = TextEditingController();
  final TextEditingController usernameCtrl = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: BackButtonWidget(
          onTap: () => {
            Get.back(),
          },
        ),
        backgroundColor: const Color(0xFF1F4247),
      ),
      body: Container(
        decoration: boxGradientDecoration,
        child: Stack(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormWidget(
                      txtHint: 'Enter Email',
                      txtController: emailCtrl,
                      width: 250,
                    ),
                    const SizedBox(height: 20),
                    TextFormWidget(
                      txtHint: 'Enter Username',
                      txtController: usernameCtrl,
                      width: 250,
                    ),
                    const SizedBox(height: 20),
                    TextFormWidget(
                      txtHint: 'Create Password',
                      isPassword: true,
                      txtController: pwdCtrl,
                      width: 250,
                    ),
                    const SizedBox(height: 20),
                    TextFormWidget(
                      txtHint: 'Confrim Password',
                      isPassword: true,
                      txtController: confrirmPwdCtrl,
                      width: 250,
                    ),
                    const SizedBox(height: 20),
                    ButtonWidget(
                      btnTxt: 'Register',
                      onPressed: () => {register(context)},
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      const TextSpan(
                          text: 'Have an Account? ',
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.0)),
                      TextSpan(
                        text: 'Login here',
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 12.0,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.offNamed(loginRoute);
                          },
                      )
                    ]))
              ],
            ),
          ),
          Obx(() {
            return authController.isLoading.value
                ? Container(
                    color: Colors.black
                        .withOpacity(0.5), // Semi-transparent overlay
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox.shrink(); // Empty container when not loading
          }),
        ]),
      ),
    );
  }

  register(context) {
    FocusScope.of(context).unfocus();
    String email = emailCtrl.text.trim();
    String username = usernameCtrl.text.trim();
    String pwd = pwdCtrl.text.trim();
    String confirmPwd = confrirmPwdCtrl.text.trim();

    if (!authController.isEmailValid(email) || email.isEmpty) {
      Get.snackbar("Message", "Please enter valid email");
      return;
    } else if (username.isEmpty) {
      Get.snackbar("Message", "Username cannot be empty");
      return;
    } else if (pwd.length < 8 || pwd.isEmpty) {
      Get.snackbar("Message", "Password should be longer than or equal 8");
      return;
    } else if (pwd != confirmPwd) {
      Get.snackbar(
          "Message", "Password and confirm password should be the same");
      return;
    } else {
      authController.register(email, username, pwd);
    }
  }
}
