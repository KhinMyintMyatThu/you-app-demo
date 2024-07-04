import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final String txtHint;
  final bool? isPassword;

  const TextFormWidget({
    super.key,
    required this.txtHint,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        obscureText: isPassword!,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10, bottom: 12),
            border: InputBorder.none,
            hintText: txtHint,
            hintStyle: const TextStyle(
              fontSize: 12,
            )),
      ),
    );
  }
}
