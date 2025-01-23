import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final void Function()? onTap;

  const BackButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: const Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              size: 15,
              color: Colors.white,
            ),
            Flexible(
                child: Text(
              'Back',
              style: TextStyle(color: Colors.white),
            )),
          ],
        ),
      ),
    );
  }
}
