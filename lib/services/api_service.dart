import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:you_app_demo/utils/constants/api_constants.dart';

class ApiService {
  Future<dynamic> postData(url, {dynamic params, String? token}) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        headers: (token != null)
            ? {
                'x-access-token': token,
                'Content-Type': 'application/json',
              }
            : {
                'Content-Type': 'application/json',
              },
        body: (params != null) ? jsonEncode(params) : null,
      );
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> getData(url, params) async {
    final response = await http.get(
      Uri.parse(url),
    );

    return response;
  }

  Future<dynamic> putData(url, params) async {
    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(params),
    );

    return response;
  }
}
