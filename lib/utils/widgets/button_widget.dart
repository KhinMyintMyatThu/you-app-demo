import 'package:flutter/material.dart';
import 'package:you_app_demo/utils/constants/route_constants.dart';

class ButtonWidget extends StatelessWidget {
  final String btnTxt;
  const ButtonWidget({super.key, required this.btnTxt});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 40,
      child: ElevatedButton(
        onPressed: () => {_login(context)},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            )),
        child: Text(
          btnTxt,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _login(context) {
    Navigator.pushNamed(context, loginRoute);
  }

  _register() {}
}
