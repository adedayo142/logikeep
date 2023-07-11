import 'dart:convert';

import 'package:logi_keep/api/api.name.dart';
import 'package:logi_keep/models/register.dart';
import 'package:logi_keep/services/generic_http_response.dart';
import 'package:logi_keep/services/http_client.dart';

class APIService {
  final HttpClientWrapper _http = HttpClientWrapper();

  //Authentication
  Future<RegisterModel> registerUser(Map<String, dynamic> body) async {
    final response = await _http.post(APIName.urlRegister, body: body);
    if (!response.success) {
      throw Exception(response.message);
    }
    return RegisterModel.fromJson(response.body);
  }

  // Future<AuthResponse> login(dynamic body) async {
  //   final response = await _http.post(APIName.urlLogin, body: body);
  //   return AuthResponse.fromJson(response.body);
  // }
}
