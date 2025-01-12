import 'package:flutter/material.dart';
import 'package:you_app_demo/utils/widgets/back_button_widget.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({super.key});

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: BackButtonWidget(
          onTap: () => {},
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Save'),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text('Tell everyone about yourself'),
            Text('What interest you?'),
          ],
        ),
      ),
    );
  }
}
