import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String btnTxt;
  final void Function()? onPressed;
  const ButtonWidget(
      {super.key, required this.btnTxt, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
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

}
