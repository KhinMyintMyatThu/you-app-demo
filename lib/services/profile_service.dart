import 'dart:convert';
import 'package:you_app_demo/models/user_model.dart';
import 'package:you_app_demo/services/api_service.dart';
import 'package:you_app_demo/utils/constants/api_constants.dart';

class ProfileService {
  final ApiService _apiService = ApiService();

  Future<UserModel?> getProfile(token) async {
    try {
      final response = await _apiService.getData(getProfileUrl, token);
      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);

        return UserModel.fromJson(responseJson['data']);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<UserModel?> createProfile(userModel, token) async {
    try {
      final response = await _apiService.postData(createProileUrl, params: userModel, token: token);
      if (response.statusCode == 201) {
        final responseJson = jsonDecode(response.body);

        return UserModel.fromJson(responseJson['data']);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<UserModel?> updateProfile(params, token) async {
    try {
      final response = await _apiService.putData(updateProfileUrl, params, token);
      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);

        return UserModel.fromJson(responseJson['data']);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
