import 'package:get/get.dart';
import 'package:you_app_demo/models/user_model.dart';
import 'package:you_app_demo/services/profile_service.dart';

class ProfileController {
  var user = Rxn<UserModel>(null);
  var isLoading = false.obs; // Observable to show loading

  final ProfileService _profileService = ProfileService();
  // final AuthController _authController = AuthController();

  Future<void> getProfile(token) async {
    isLoading.value = true;

    try {
      final UserModel? userProfile = await _profileService.getProfile(token);

      if (userProfile != null) {
        user.value = userProfile;
        isLoading.value = false;
      } else {
        Get.snackbar('Error', 'Error while retrieving profile');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateProfile(params, token) async {
    isLoading.value = true;

    final paramsData = {
      "name": params.name,
      "birthday": params.dob,
      "height": params.height,
      "weight": params.weight,
      "interests": params.interests ?? []
    };

    try {
      await _profileService.updateProfile(paramsData, token);
      UserModel? userModel = await _profileService.getProfile(token);

      if (userModel != null) {
        userModel.age = params.age;
        userModel.gender = params.gender;
        userModel.image = params.image;
        user.value = userModel;
        isLoading.value = false;
      } else {
        Get.snackbar('Error', 'Error while updating profile');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred');
    } finally {
      isLoading.value = false;
    }
  }

  getUserData(type) {
    UserModel? userObj = user.value;
    dynamic returnValue;
    if (userObj != null) {
      switch (type) {
        case 'username':
          returnValue = userObj.username;
          break;
        case 'name':
          returnValue = userObj.name;
          break;
        case 'birthday':
          returnValue = userObj.dob;
          break;
        case 'height':
          returnValue = userObj.height;
          break;
        case 'weight':
          returnValue = userObj.weight;
          break;
        case 'interests':
          returnValue = userObj.interests;
          break;
        case 'image':
          returnValue = userObj.image;
          break;
        case 'age':
          returnValue = userObj.age;
          break;
        case 'gender':
          returnValue = userObj.gender;
          break;
        case 'horoscope':
          returnValue = userObj.horoscope;
          break;
        case 'zodiac':
          returnValue = userObj.zodiac;
          break;
        default:
          returnValue = userObj;
      }
      return returnValue;
    } else {
      return '';
    }
  }

  int calculateAge(String dob) {
    List<String> dobParts = dob.contains('/') ? dob.split('/') : dob.split('.');
    int month = int.parse(dobParts[0]);
    int day = int.parse(dobParts[1]);
    int year = int.parse(dobParts[2]);

    // Create a DateTime object for the DOB
    DateTime birthDate = DateTime(year, month, day);

    // Get the current date
    DateTime today = DateTime.now();

    // Calculate age
    int age = today.year - birthDate.year;

    // Adjust if the birthday hasn't occurred yet this year
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }
}
