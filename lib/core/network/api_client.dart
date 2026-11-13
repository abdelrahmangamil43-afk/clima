import 'dart:convert';

import 'package:climaa/core/network/api_result.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<ApiResult<Map<String, dynamic>>> get(Uri uri) async {
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return ApiSuccess(jsonDecode(response.body) as Map<String, dynamic>);
      }
      return ApiError('Request failed with status ${response.statusCode}');
    } catch (e) {
      return ApiError(e.toString());
    }
  }
}
