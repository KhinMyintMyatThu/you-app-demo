import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:you_app_demo/services/auth_service.dart';
import 'package:you_app_demo/utils/constants/route_constants.dart';

class AuthController extends GetxController {
  static const _accessTokenKey = 'access_token';

  var isLoggedIn = false.obs; // Observable to track login state
  var userToken = ''.obs; // Observable to store user token
  var isLoading = false.obs; // Observable to show loading

  // Persistent storage
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Reactive token state
  var accessToken = Rxn<String>();

  final AuthService _authService = AuthService();

  Future<void> register(String email, String username, String password) async {
    isLoading.value = true;

    try {
      final response = await _authService.register(
        email: email,
        username: username,
        password: password,
      );

      if (response == 'Created') {
        isLoggedIn.value = false;
        Get.snackbar('Message', 'Successfully registered!');
        Get.offNamed(loginRoute); // Navigate to Home Page
      } else if(response == 'User already exists') {
        Get.snackbar('Error', 'Existing user!');
      } else{
         Get.snackbar('Error', 'Invalid credentials');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String email, String username, String password) async {
    isLoading.value = true;

    try {
      final token = await _authService.login(
        email: email,
        username: username,
        password: password,
      );

      if (token != null) {
        userToken.value = token;
        isLoggedIn.value = false;
        saveToken(token);
        Get.offNamed(profileRoute); // Navigate to Home Page
      } else {
        Get.snackbar('Error', 'Invalid credentials');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred');
    } finally {
      isLoading.value = false;
    }
  }

  bool isEmailValid(String email) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }

  // Save token on login
  Future<void> saveToken(String token) async {
    accessToken.value = token;
    await _storage.write(key: _accessTokenKey, value: token);
  }

  // Load token on app start
  Future<void> loadToken() async {
    String? token = await _storage.read(key: _accessTokenKey);
    accessToken.value = token;
  }
}
