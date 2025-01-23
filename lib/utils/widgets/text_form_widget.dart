import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final String txtHint;
  final bool? isPassword;
  final TextEditingController txtController;
  final double? width;
  final bool? readOnly;
  final TextInputType? textInputType;
  final Function()? onTap;
  final bool enable;

  const TextFormWidget(
      {super.key,
      required this.txtHint,
      this.isPassword = false,
      required this.txtController,
      this.width = 220,
      this.readOnly = false,
      this.textInputType,
      this.onTap,
      this.enable = true
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        keyboardType: textInputType?? TextInputType.text,
        style: const TextStyle(fontSize: 12.0),
        controller: txtController,
        obscureText: isPassword!,
        readOnly: readOnly!,
        onTap: onTap,
        enabled: enable,
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
