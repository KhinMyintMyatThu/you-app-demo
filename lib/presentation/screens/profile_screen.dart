import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:you_app_demo/utils/constants/route_constants.dart';
import 'package:you_app_demo/utils/widgets/text_form_widget.dart';

import '../../utils/widgets/back_button_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final boxDecoration = const BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ));

  double _height = 130;
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: const BackButtonWidget(),
        title: const Text(
          '@johndoe',
          style: TextStyle(fontSize: 15),
        ),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.more_horiz))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: boxDecoration,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 8.0),
                    child: Text(
                      '@johndoe123,',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: MediaQuery.of(context).size.width,
                height: _height,
                padding: const EdgeInsets.all(20),
                decoration: boxDecoration,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'About',
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: (!_isEditing) ? _editAbout : _saveAbout,
                            child: (!_isEditing)
                                ? const Text(
                                    'Edit',
                                    style: TextStyle(color: Colors.white),
                                  )
                                : const Text(
                                    'Save & Update',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (!_isEditing) ...[ //TODO:
                        const Text(
                          'Add in your about to help others know you better',
                          style: TextStyle(color: Colors.white),
                        )
                      ] else ...[
                        _showAbout()
                      ]
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 130,
                padding: const EdgeInsets.all(20),
                decoration: boxDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'About',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () =>
                              {Navigator.pushNamed(context, interestRoute)},
                          child: const Text(
                            'Edit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Add in your about to help others know you better',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _editAbout() {
    setState(() {
      _height = 450;
      _isEditing = true;
    });
  }

  _saveAbout() {
    setState(() {
      _height = 130;
      _isEditing = false;
    });
  }

  _showAbout() {
    // if (!_isEditing) ...[
    //                     const Text(
    //                       'Add in your about to help others know you better',
    //                       style: TextStyle(color: Colors.white),
    //                     )
    //                   ] else ...[
    //                   ]
    return const Column(
      children: [
        //Name
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Display name:',
              style: TextStyle(color: Colors.white),
            ),
            TextFormWidget(txtHint: 'Enter name')
          ],
        ),
        SizedBox(height: 10),
        //Gender
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Gender:',
              style: TextStyle(color: Colors.white),
            ),
            TextFormWidget(txtHint: 'Enter name')
          ],
        ),
        SizedBox(height: 10),
        //Birthday
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Birthday:',
              style: TextStyle(color: Colors.white),
            ),
            TextFormWidget(txtHint: 'Enter name')
          ],
        ),
        SizedBox(height: 10),
        //Horoscope
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Horoscope:',
              style: TextStyle(color: Colors.white),
            ),
            TextFormWidget(txtHint: 'Enter name')
          ],
        ),
        SizedBox(height: 10),
        //Zodiac
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Zodiac:',
              style: TextStyle(color: Colors.white),
            ),
            TextFormWidget(txtHint: 'Enter name')
          ],
        ),
        SizedBox(height: 10),
        //Height
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Height:',
              style: TextStyle(color: Colors.white),
            ),
            TextFormWidget(txtHint: 'Enter name')
          ],
        ),
        SizedBox(height: 10),
        //Weight
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Weight:',
              style: TextStyle(color: Colors.white),
            ),
            TextFormWidget(txtHint: 'Enter name')
          ],
        )
      ],
    );
  }
}
