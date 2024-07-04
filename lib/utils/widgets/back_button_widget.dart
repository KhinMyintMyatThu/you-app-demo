import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 15,
          ),
          Flexible(child: Text('Back')),
        ],
      ),
    );
  }
}
