// class WeatherHourlyModel {
//   String hour;
//   String degree;
//   String image;
//   WeatherHourlyModel({
//     required this.hour,
//     required this.degree,
//     required this.image,
//   });
//   factory WeatherHourlyModel.fromJson(dynamic json) {
//     return WeatherHourlyModel(
//       hour: json['location']['localtime'],
//       degree: json['current']['temp_c'],
//       image: json['current']['condition']['icon'],
//     );
//   }
//   @override
//   String toString() {
//     return 'hour =$hour' 'degree =$degree' 'image =$image';
//   }
// }

class WeatherDailyModel {
  final String image;
  final String date;
  final String maxDegree;
  final String minDegree;
  final String status;
  WeatherDailyModel({
    required this.image,
    required this.date,
    required this.maxDegree,
    required this.minDegree,
    required this.status,
  });
}

class WeatherCurrentModel {
  String ?locationName;
  String ?currentTemp;
  String ?image;
  String ?currentDate;
  String ?status;
  // String maxDegree;
  // String minDegree;

  WeatherCurrentModel({
    required this.locationName,
    required this.currentTemp,
    required this.image,
    required this.currentDate,
    required this.status,
    // required this.maxDegree,
    // required this.minDegree,
  });
  factory WeatherCurrentModel.fromJson(dynamic json) {
    return WeatherCurrentModel(
      locationName: json['location']['name'],
      currentTemp: json['current']['temp_c'],
      image: json['current']['condition']['icon'],
      currentDate: json['location']['localtime'],
      status: json['current']['condition']['text'],
      // maxDegree: json['forecast']['forecastday']['maxtemp_c'],
      // minDegree: json['forecast']['forecastday']['mintemp_c'],
    );
  }
  @override
  String toString() {
    return 'locationName =$locationName'
    'currentTemp =$currentTemp'
    'image =$image'
    'currentDate =$currentDate'
    'status =$status'
     ;
  }
}
