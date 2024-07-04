import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> postData(url, params) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(params),
    );

    return response;
  }

  Future<dynamic> getData(url, params) async {
    final response = await http.get(Uri.parse(url),);

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
