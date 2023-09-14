import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/class.dart';

class WeatherDailyController {
  // String baseUrl = 'http://api.weatherapi.com/v1';
  // String apiKey = '7a18aaf102854cbfa9b90002231009';
  static Future<WeatherDailyModel> getDailyWeather(
      {required String cityNmae}) async {
    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=e2f0d73ee2114cf09b064439231109&q=$cityNmae&days=7&aqi=no&alerts=no'));
    if (response.statusCode == 200) {
      // print(response.body);
      return WeatherDailyModel.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception('Failed to load Weather');
    }
  }
}
