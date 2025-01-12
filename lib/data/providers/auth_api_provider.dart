import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:you_app_demo/utils/constants/api_constants.dart';

class AuthApiProvider {
  Future<dynamic> register(
      String email, String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'username': username,
        'password': password,
      }),
    );

    return response;
  }

  Future<dynamic> login(String email, String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'username': username,
        'password': password,
      }),
    );

    return response;
  }
}
