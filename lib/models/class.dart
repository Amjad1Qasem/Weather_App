class WeatherDailyModel {
  String image;
  String date;
  String maxDegree;
  String minDegree;
  String status;
  WeatherDailyModel({
    required this.image,
    required this.date,
    required this.maxDegree,
    required this.minDegree,
    required this.status,
  });
}
///////////////////

// class WeatherDailyModel {
//    String? date;
//    Forecastday ?forecastday;

//   factory WeatherDailyModel.fromJson(Map<String, dynamic> json) {
//     return WeatherDailyModel(
//       date: json['date'],
//       forecastday: Forecastday.fromJson(json['forecastday'][0]),
//     );
//   }
// }

// class Forecastday {
//    MaxtempC maxtempC;
//    MaxtempF maxtempF;
//    MintempC mintempC;
//    MintempF mintempF;
//    AvgtempC avgtempC;
//    AvgtempF avgtempF;
//    Condition ?condition;

//   factory Forecastday.fromJson(Map<String, dynamic> json) {
//     return Forecastday(
//       maxtempC: json['maxtemp_c'],
//       maxtempF: json['maxtemp_f'],
//       mintempC: json['mintemp_c'],
//       mintempF: json['mintemp_f'],
//       avgtempC: json['avgtemp_c'],
//       avgtempF: json['avgtemp_f'],
//       condition: Condition.fromJson(json['condition']),

//       hour: [
//         Hour.fromJson(hour)
//       ],
//     );
//   }
// }

// .........
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
      icon: json['icon'] as String,
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
