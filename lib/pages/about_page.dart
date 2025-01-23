import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:you_app_demo/controllers/auth_controller.dart';
import 'package:you_app_demo/controllers/date_picker_controller.dart';
import 'package:you_app_demo/controllers/dropdown_controller.dart';
import 'package:you_app_demo/controllers/profile_controller.dart';
import 'package:you_app_demo/models/user_model.dart';
import 'package:you_app_demo/utils/constants/widget_constants.dart';
import 'package:you_app_demo/utils/widgets/skeleton_widget.dart';
import 'package:you_app_demo/utils/widgets/text_form_widget.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  RxBool isEditing = false.obs;
  Rx<File?> img = Rx<File?>(null);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController horoscopeController = TextEditingController();
  final TextEditingController zodiacController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final ProfileController profileController = Get.put(ProfileController());
  final DatePickerController dobController = Get.put(DatePickerController());
  final DropdownController genderController = Get.put(DropdownController());
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: MediaQuery.of(context).size.width,
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
                    onTap: (!isEditing.value) ? _edit : _save,
                    child: (!isEditing.value)
                        ? const Icon(
                            Icons.edit,
                            color: Colors.white,
                          )
                        : const Text(
                            'Save & Update',
                            style: TextStyle(color: Colors.yellow),
                          ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (!isEditing.value) ...[
                Obx(() {
                  UserModel? user = profileController.user.value;
                  var isLoading = profileController.isLoading.value;
                  return (isLoading)
                      ? _showLoading(400.0)
                      : (checkUserData(user))
                          ? _displayDetails(user)
                          : const Text(
                              'Add in your details to help others know you better',
                              style: TextStyle(color: Colors.white),
                            );
                }),
              ] else ...[
                _editAbout()
              ]
            ],
          ),
        ),
      );
    });
  }

  _edit() {
    UserModel? user = profileController.user.value;
    if (user != null) {
      nameController.text = user.name;
      genderController.selectedItem.value = user.gender;
      dobController.selectedDate.value = user.dob;
      heightController.text = user.height.toString();
      weightController.text = user.weight.toString();
    }
    isEditing.value = true;
  }

  _save() {
    var name = nameController.text;
    var gender = genderController.selectedItem.value;
    var dob = dobController.selectedDate.value.split(' ').join('.');
    var height = heightController.text;
    var weight = weightController.text;

    if (name.isEmpty ||
        gender.isEmpty ||
        dob.isEmpty ||
        height.isEmpty ||
        weight.isEmpty) {
      Get.snackbar('Message', 'Please ensure all the fields are entered');
    } else {
      final token = authController.accessToken.value;
      final paramDob = dob.split('/').join('.');
      var age = profileController.calculateAge(dob);
      var interests = profileController.getUserData('interests');
      UserModel userModel = UserModel(
          name: name,
          dob: paramDob,
          height: int.parse(height),
          weight: int.parse(weight),
          gender: gender,
          image: img.value,
          age: age,
          interests: interests);
      profileController.updateProfile(userModel, token);
      isEditing.value = false;
    }
  }

  _editAbout() {
    return Column(
      children: [
        _imageRow(),
        const SizedBox(height: 30),
        //Name
        _aboutRow('Display name:', 'Enter name', nameController),
        const SizedBox(height: 10),
        //Gender
        _aboutGenderRow(),
        const SizedBox(height: 10),
        //Birthday
        Obx(() {
          return _aboutRow(
            'Birthday:',
            dobController.selectedDate.value.split(' ').join('.'),
            dateController,
            readOnly: true,
            onTap: () {
              dobController.selectDate(context, profileController.user.value);
            },
          );
        }),
        const SizedBox(height: 10),
        //Horoscope
        Obx(() {
          return _aboutRow(
              'Horoscope', dobController.horoscope.value, horoscopeController,
              readOnly: true, enabled: false);
        }),
        const SizedBox(height: 10),
        //Zodiac
        Obx(() {
          return _aboutRow(
              'Zodiac', dobController.zodiac.value, zodiacController,
              readOnly: true, enabled: false);
        }),
        const SizedBox(height: 10),
        //Height
        _aboutRow('Height', 'Add Height', heightController,
            inputType: TextInputType.number),
        const SizedBox(height: 10),
        //Weight
        _aboutRow('Weight', 'Add Weight', weightController,
            inputType: TextInputType.number)
      ],
    );
  }

  _aboutGenderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Gender',
          style: TextStyle(color: Colors.white),
        ),
        Obx(() {
          return Container(
            width: 220,
            height: 40,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: const Text(
                  'Select gender',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                style: const TextStyle(fontSize: 12.0, color: Colors.black),
                isExpanded: true,
                value: genderController.selectedItem.value.isEmpty
                    ? null
                    : genderController.selectedItem.value,
                items: genderController.items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    genderController.setSelectedItem(newValue);
                  }
                },
              ),
            ),
          );
        })
      ],
    );
  }

  _aboutRow(
    label,
    hint,
    controller, {
    bool readOnly = false,
    Function()? onTap,
    TextInputType? inputType,
    bool enabled = true,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        TextFormWidget(
          txtHint: hint,
          txtController: controller!,
          width: 220,
          readOnly: readOnly,
          onTap: onTap,
          enable: enabled,
        )
      ],
    );
  }

  _imageRow() {
    return Row(
      children: [
        Obx(() {
          return (img.value != null)
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.file(
                    img.value!,
                    width: 60,
                    height: 65,
                    fit: BoxFit.cover,
                  ),
                )
              : GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 60,
                    height: 65,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 30, color: Colors.yellow),
                    ),
                  ),
                );
        }),
        const SizedBox(width: 20),
        const Text(
          'Add Image',
          style: TextStyle(fontSize: 12, color: Colors.white),
        )
      ],
    );
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

  _displayDetails(user) {
    return Column(
      children: [
        _detailRow('Birthday', user.dob),
        _detailRow('Horoscope', user.horoscope),
        _detailRow('Zodiac', user.zodiac),
        _detailRow('Height', '${user.height} cm'),
        _detailRow('Weight', '${user.weight} kg'),
      ],
    );
  }

  _detailRow(label, value) {
    const txtStyle = TextStyle(color: Colors.white);
    return value != null
        ? Row(
            children: [
              Text('$label : ', style: txtStyle),
              Text(
                value,
                style: txtStyle,
              )
            ],
          )
        : Container();
  }

  checkUserData(user) {
    return (user.name != "" ||
        user.dob != "" ||
        user.height != 0 ||
        user.weight != 0 ||
        user.interests.length != 0);
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery, // or ImageSource.camera
      maxWidth: 800, // Resize the image if needed
      maxHeight: 800,
      imageQuality: 80, // Compress the image (0-100)
    );

    if (pickedImage != null) {
      img.value = File(pickedImage.path);
    }
  }
}
