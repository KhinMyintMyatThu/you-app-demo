import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String btnTxt;
  final void Function()? onPressed;
  const ButtonWidget(
      {super.key, required this.btnTxt, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        gradient: LinearGradient(
          colors: [Color(0xFF62CDCB), Color(0xFF4599DB)], // Define your colors
          begin: Alignment.topLeft, // Starting point of the gradient
          end: Alignment.bottomRight, // Ending point of the gradient
        ),
      ),
      child: SizedBox(
        width: 250,
        height: 40,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: Text(
            btnTxt,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
