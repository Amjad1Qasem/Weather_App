import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/class.dart';
import 'package:weather_app/utilities/log.dart';

class WeatherCurrentController {
  // String baseUrl = 'http://api.weatherapi.com/v1';
  // String apiKey = '7a18aaf102854cbfa9b90002231009';
  static Future<WeatherCurrentModel> getCurrentWeather(
      {required String cityName}) async {
    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=e2f0d73ee2114cf09b064439231109&q=$cityName&days=1&aqi=no&alerts=no'));
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return WeatherCurrentModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('City name was not found');
  }
}
