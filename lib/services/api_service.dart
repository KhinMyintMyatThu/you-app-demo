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

  Future<dynamic> getData(url, String? token) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + url), headers: {
        'x-access-token': token!,
        'Content-Type': 'application/json',
      });

      return response;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> putData(url, dynamic params, String token) async {
    final response = await http.put(
      Uri.parse(baseUrl + url),
      headers: { 'x-access-token': token, 'Content-Type': 'application/json'},
      body: jsonEncode(params),
    );

    return response;
  }
}
