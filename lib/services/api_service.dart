import 'dart:convert';

import 'package:efgecom/config/api_config.dart';
import 'package:efgecom/helpers/http.dart';
import 'package:efgecom/helpers/lite_data.dart';

class ApiService {
  final apiUrl = API_BASE_URL;
  // ignore: unused_field
  final HTTP _http = HTTP();

  Future<ApiResponse> cookieRequest() async {
    try {
      final apiResponse = await _http.get(apiUrl);
      return _processApiResponse(apiResponse);
    } catch (e) {
      ApiResponse response = ApiResponse(success: false, message: e.toString());
      return Future.value(response);
    }
  }

  Future<ApiResponse> login(String username, String password) async {
    try {
      final apiResponse = await _http.post(apiUrl + "/auth/login", {});
      return _processApiResponse(apiResponse);
    } catch (e) {
      ApiResponse response = ApiResponse(success: false, message: e.toString());
      return Future.value(response);
    }
  }

  static ApiResponse _processApiResponse(dynamic apiResponse) {
    try {
      if (apiResponse.statusCode != null) {
        if (apiResponse.statusCode == 200) {
          var body = jsonDecode(apiResponse.body);
          var res = ApiResponse.fromJson(body);
          return res;
        } else {
          return ApiResponse.fromJson(jsonDecode(apiResponse.body));
        }
      } else {
        ApiResponse response =
            ApiResponse(success: false, message: "Server error");
        return response;
      }
    } catch (e) {
      ApiResponse response = ApiResponse(success: false, message: e.toString());
      return response;
    }
  }
}

class ApiResponse {
  late bool success;
  String? message;
  LiteData? data;
  int? type;

  ApiResponse({this.success = false, this.message, this.data, this.type});

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        success: json['success'] ?? false,
        message: json['error'].toString(),
        type: json['type'],
        data: json['success'] == true
            ? LiteData(data: json['data'], type: json['type'])
            : null,
      );
}
