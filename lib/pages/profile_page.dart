import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_app_demo/controllers/auth_controller.dart';
import 'package:you_app_demo/controllers/date_picker_controller.dart';
import 'package:you_app_demo/controllers/dropdown_controller.dart';
import 'package:you_app_demo/controllers/profile_controller.dart';
import 'package:you_app_demo/pages/about_page.dart';
import 'package:you_app_demo/utils/constants/route_constants.dart';
import 'package:you_app_demo/utils/constants/widget_constants.dart';
import 'package:you_app_demo/utils/widgets/skeleton_widget.dart';
import '../utils/widgets/back_button_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController horoscopeController = TextEditingController();
  final TextEditingController zodiacController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final ProfileController profileController = Get.put(ProfileController());
  final DatePickerController datePickerController =
      Get.put(DatePickerController());
  final DropdownController dropdownController = Get.put(DropdownController());
  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    final token = authController.accessToken.value;
    profileController.getProfile(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: BackButtonWidget(
          onTap: () => {Get.back()},
        ),
        title: _showUsername(),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.more_horiz))
        ],
        backgroundColor: const Color(0xFF09141A),
      ),
      body: Container(
        color: const Color(0xFF09141A),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Obx(() {
                  return Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: boxDecoration,
                          child: (profileController.getUserData('image') !=
                                      null &&
                                  profileController.getUserData('image') != '')
                              ? Image.file(
                                  profileController.getUserData('image'),
                                  fit: BoxFit.cover,
                                )
                              : null),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, bottom: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [_showUsername(), _showAge()],
                            ),
                            _showGender(),
                            _showHoroscope()
                          ],
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 5),
                const AboutPage(),
                const SizedBox(height: 5),
                _interest(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showUsername() {
    return Obx(() {
      return profileController.isLoading.value
          ? _showLoading(40.0)
          : Text(
              profileController.getUserData('username'),
              style: const TextStyle(fontSize: 13, color: Colors.white),
            );
    });
  }

  _showAge() {
    return Obx(() {
      return profileController.isLoading.value
          ? _showLoading(40.0)
          : (profileController.getUserData('age') != null &&
                  profileController.getUserData('age') != 0)
              ? Text(
                  ' , ${profileController.getUserData('age').toString()}',
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                )
              : Container();
    });
  }

  _showGender() {
    return Obx(() {
      return profileController.isLoading.value
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: _showLoading(60.0))
          : (profileController.getUserData('gender') != null)
              ? Text(
                  profileController.getUserData('gender'),
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                )
              : Container();
    });
  }

  _showHoroscope() {
    return Obx(() {
      return profileController.isLoading.value
          ? _showLoading(100.0)
          : (profileController.getUserData('horoscope') != "" ||
                  profileController.getUserData('zodiac') != "")
              ? Row(
                  children: [
                    (profileController.getUserData('horoscope') != "")
                        ? Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Chip(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius as needed
                                side: const BorderSide(
                                  // Add a border if you want
                                  color: Colors.grey,
                                ),
                              ),
                              backgroundColor: Colors.black.withOpacity(0.6),
                              label: Text(
                                profileController.getUserData('horoscope'),
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.white),
                              ),
                            ),
                          )
                        : Container(),
                    (profileController.getUserData('zodiac') != "")
                        ? Chip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Adjust the radius as needed
                              side: const BorderSide(
                                // Add a border if you want
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            backgroundColor: Colors.black.withOpacity(0.6),
                            label: Text(
                              profileController.getUserData('zodiac'),
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.white),
                            ),
                          )
                        : Container(),
                  ],
                )
              : Container();
    });
  }

  _showLoading(width) {
    return Container(
        width: width,
        height: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey,
        ),
        child: const SkeletonLoading());
  }

  _interest() {
    return Container(
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
                'Interest',
                style: TextStyle(color: Colors.white),
              ),
              GestureDetector(
                onTap: () => {Get.toNamed(interestRoute)},
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Obx(() {
            var interests = profileController.getUserData('interests');
            return profileController.isLoading.value
                ? _showLoading(400.0)
                : (interests != null && interests.length > 0)
                    ? _displayInterests(interests)
                    : const Text(
                        'Add in your about to help others know you better',
                        style: TextStyle(color: Colors.white),
                      );
          })
        ],
      ),
    );
  }

  _displayInterests(interests) {
    return Flexible(
      child: Wrap(
        children: interests
            .map<Widget>(
              (interest) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Chip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the radius as needed
                    side: const BorderSide(
                      // Add a border if you want
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  label: Text(interest),
                  backgroundColor: Colors.transparent,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
