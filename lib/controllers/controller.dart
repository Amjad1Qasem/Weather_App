import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/class.dart';
import 'package:weather_app/utilities/log.dart';

class WeatherCurrentController {
  // String baseUrl = 'http://api.weatherapi.com/v1';
  // String apiKey = '7a18aaf102854cbfa9b90002231009';
  static Future<WeatherCurrentModel> getCurrentWeather(
      {required String cityNmae}) async {
    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=7a18aaf102854cbfa9b90002231009&q=$cityNmae&days=7&aqi=no&alerts=yes'));
    // dynamic data = jsonDecode(response.body);
    // WeatherCurrentModel weatherCurrent = WeatherCurrentModel.fromJson(data);
    // // debugPrint(weatherCurrent);
    // return weatherCurrent;
     print(response.body);
    return (jsonDecode(response.body)['data'] )
        .map((json) => WeatherCurrentModel.fromJson(json))
        .toList();
  }
}
