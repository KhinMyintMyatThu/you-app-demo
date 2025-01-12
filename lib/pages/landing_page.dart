import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:you_app_demo/utils/constants/route_constants.dart';

import '../utils/widgets/button_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.pink,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: TextDecoration.none),
            ),
            const SizedBox(height: 100),
            ButtonWidget(
              btnTxt: 'Login',
              onPressed: () => {
                Get.toNamed(loginRoute)
              },
            ),
            const SizedBox(height: 10),
            ButtonWidget(
              btnTxt: 'Register',
              onPressed: () => {
                 Get.toNamed(registerRoute)
              },
            ),
          ],
        ),
      ),
    );
  }
}
