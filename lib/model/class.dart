class WeatherInHour {
  final String hour;
  final String degree;
  final String image;
  WeatherInHour({
   required this.hour,
   required this.degree,
   required this.image,
  });
}

class WeatherInDay {
  final String image;
  final String date;
  final String maxDegree;
  final String minDegree;
  final String status;
  WeatherInDay({
    required this.image,
    required this.date,
    required this.maxDegree,
    required this.minDegree,
    required this.status,
  });
}
