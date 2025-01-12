import 'package:you_app_demo/controllers/auth_controller.dart';
import 'package:you_app_demo/models/user_model.dart';
import 'package:you_app_demo/services/api_service.dart';
import 'package:you_app_demo/utils/constants/api_constants.dart';

class ProfileService {
  final ApiService _apiService = ApiService();

  Future<UserModel?> getProfile(token) async {
    final response = await _apiService.postData(getUrl, token: token);
    return null;
  }
}
