import 'package:get/get.dart';
import 'package:you_app_demo/controllers/auth_controller.dart';
import 'package:you_app_demo/models/user_model.dart';
import 'package:you_app_demo/services/profile_service.dart';

class ProfileController {
  var user = Rxn<UserModel>(null);
  var isLoading = false.obs; // Observable to show loading

  final ProfileService _profileService = ProfileService();
  final AuthController _authController = AuthController();

  Future<void> createProfile(UserModel user) async {}

  Future<void> getProfile() async {
    isLoading.value = true;

    try {
      final token = _authController.accessToken.value;
      final UserModel? loggedInUser = await _profileService.getProfile(token);

      if (loggedInUser != null) {
        user.value = loggedInUser;
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

  Future<void> updateProfile() async {}
}
