import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/class.dart';
import 'package:weather_app/utilities/log.dart';

class WeatherHourlyController {
  // String baseUrl = 'http://api.weatherapi.com/v1';
  // String apiKey = '7a18aaf102854cbfa9b90002231009';
  static Future<WeatherHourlyModel> getHourlytWeather(
      {required String cityNmae}) async {
    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=e2f0d73ee2114cf09b064439231109&q=$cityNmae&days=1&aqi=no&alerts=no'));
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return WeatherHourlyModel.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception('Failed to load Weather');
    }
  }
}
