// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:weather_app/models/class.dart';

// class WeatherHourlyController {
//   // String baseUrl = 'http://api.weatherapi.com/v1';
//   // String apiKey = 'f3f74f43054c4605b7d50128231009';
//   static Future<WeatherHourlyModel> getWeatherHourly({ String? location}) async {
//     final response = await http.get(Uri.parse(
//         'http://api.weatherapi.com/v1/forecast.json?key=7a18aaf102854cbfa9b90002231009&q=$location&aqi=no'));
//     // dynamic data = jsonDecode(response.body);
//     // WeatherHourlyModel weather = WeatherHourlyModel.fromJson(data);
//     // return weather;
//     print(response.body);
//     return (jsonDecode(response.body)['data'])
//         .map((json) => WeatherHourlyModel.fromJson(json))
//         .toList();
//   }
// }
