import 'package:flutter/material.dart';

import '../../utils/widgets/button_widget.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.pink,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                decoration: TextDecoration.none
              ),
            ),
            SizedBox(height: 100),
            ButtonWidget(
              btnTxt: 'Login',
            ),
            SizedBox(height: 10),
            ButtonWidget(
              btnTxt: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
