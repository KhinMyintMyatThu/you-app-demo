import 'package:you_app_demo/services/api_service.dart';
import 'package:you_app_demo/utils/constants/api_constants.dart';
import 'dart:convert';

class AuthService {
  final ApiService _apiService = ApiService();

  Future<String?> register({
    required String email,
    required String username,
    required String password,
  }) async {
    final response = await _apiService.postData(
      registerUrl,
      params: {
        'email': email,
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 201) {
      final responseJson = jsonDecode(response.body);
      if(responseJson['message'] == 'User already exists'){
        return responseJson['message'];
      } else {
        return 'Created';
      }
    } else {
      return null;
    }
  }

  Future<String?> login({
    required String email,
    required String username,
    required String password,
  }) async {
    final response = await _apiService.postData(
      loginUrl,
      params: {
        'email': email,
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 201) {
      final responseJson = jsonDecode(response.body);
      return responseJson['access_token'];
    } else {
      return null;
    }
  }
}
