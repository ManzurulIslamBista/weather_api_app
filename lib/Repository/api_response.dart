import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather_api_app/ViewModels/current_weather.dart';

class ApiResponse{
  Future<dynamic> getResponse(String domain, String baseUrl) async {
    final jsonData = await http.get(Uri.parse(domain + baseUrl));
    if (jsonData.statusCode == 200) {
      dynamic response = jsonDecode(jsonData.body);
      return response;
    }
  }
}
