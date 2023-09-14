// class WeatherDailyModel {
//   String image;
//   String maxDegree;
//   String minDegree;
//   String status;
//   WeatherDailyModel({
//     required this.image,
//     required this.date,
//     required this.maxDegree,
//     required this.minDegree,
//     required this.status,
//   });
// }

import 'dart:developer';

class WeatherDayModel {
  String date;
  String image;
  double maxDegreec;
  double minDegreec;
  double maxDegreef;
  double minDegreef;
  String status;

  WeatherDayModel({
    required this.date,
    required this.image,
    required this.maxDegreec,
    required this.minDegreec,
    required this.maxDegreef,
    required this.minDegreef,
    required this.status,
  });

  factory WeatherDayModel.fromJson(Map<String, dynamic> json) {
    return WeatherDayModel(
      date: json['date'],
      image:'https:' +
          json['day']['condition']['icon'],
      maxDegreec:json['day']['maxtemp_c'],
      minDegreec:json['day']['mintemp_c'],
      maxDegreef:json['day']['maxtemp_f'],
      minDegreef:json['day']['mintemp_f'],
      status: json['day']['condition']['text'],
    );
  }
}

class WeatherDailyModel {
  String date;
  String image;
  double maxDegreec;
  double minDegreec;
  double maxDegreef;
  double minDegreef;
  String status;
  List<WeatherHourlyModel> hours;
  List<WeatherDayModel> days;
  WeatherDailyModel({
    required this.date,
    required this.image,
    required this.maxDegreec,
    required this.minDegreec,
    required this.maxDegreef,
    required this.minDegreef,
    required this.status,
    required this.hours,
    required this.days,
  });

  factory WeatherDailyModel.fromJson(Map<String, dynamic> json) {
    return WeatherDailyModel(
      date: json['forecast']['forecastday'][0]['date'],
      image: 'https:' +
          json['forecast']['forecastday'][0]['day']['condition']['icon'],
      maxDegreec: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minDegreec: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxDegreef: json['forecast']['forecastday'][0]['day']['maxtemp_f'],
      minDegreef: json['forecast']['forecastday'][0]['day']['mintemp_f'],
      status: json['forecast']['forecastday'][0]['day']['condition']['text'],
      hours: (json['forecast']['forecastday'][0]['hour'] as List)
          .map((hour) => WeatherHourlyModel.fromJson(hour))
          .toList(),
      days: (json['forecast']['forecastday'] as List)
          .map((day) => WeatherDayModel.fromJson(day))
          .toList(),
    );
  }
}

// .................
class WeatherHourlyModel {
  final String hour;
  final double tempc;
  final double tempf;
  final String image;
  final String status;

  WeatherHourlyModel({
    required this.hour,
    required this.tempc,
    required this.tempf,
    required this.image,
    required this.status,
  });

  factory WeatherHourlyModel.fromJson(Map<String, dynamic> json) {
    return WeatherHourlyModel(
      // hour: json  ['time'] as String,
      hour: json['time'],
      tempc: json['temp_c'],
      tempf: json['temp_f'],
      image: 'https:' + json['condition']['icon'],
      status: json['condition']['text'],
    );
  }
}

///////////////////
class Condition {
  final String text;
  final String icon;

  Condition({
    required this.text,
    required this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'] as String,
      icon: 'https:${json['icon'] as String}',
    );
  }
}

class Current {
  final String lastupdated;
  final double tempc;
  final double tempf;
  final Condition condition;

  Current({
    required this.lastupdated,
    required this.tempc,
    required this.tempf,
    required this.condition,
  });
  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      lastupdated: json['last_updated'] as String,
      tempc: json['temp_c'] as double,
      tempf: json['temp_f'] as double,
      condition: Condition.fromJson(json['condition']),
    );
  }
}

class Location {
  final String name;
  final String country;
  final String localtime;

  Location(
      {required this.name, required this.country, required this.localtime});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      country: json['country'],
      localtime: json['localtime'],
    );
  }
}

class WeatherCurrentModel {
  Location location;
  Current current;

  WeatherCurrentModel({required this.location, required this.current});

  factory WeatherCurrentModel.fromJson(Map<String, dynamic> json) {
    return WeatherCurrentModel(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
    );
  }
}
