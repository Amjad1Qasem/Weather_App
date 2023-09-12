import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/constants/app_images.dart';
import 'package:weather_app/controllers/controller.dart';
import 'package:weather_app/controllers/weather_hourly_controller.dart';
import 'package:weather_app/models/class.dart';
import 'package:weather_app/screens/widgets/weather_day.dart';
import 'package:weather_app/screens/widgets/weather_hour.dart';
import 'package:weather_app/utilities/translation.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  String weatherCondition = 'Partially cloudy';
  String degree = '24°';
  List<WeatherHourlyModel> listOfWeatherHourlyModel = [
    WeatherHourlyModel(image: AppImages.clear, hour: 'now', degree: '24°'),
    WeatherHourlyModel(image: AppImages.cloudy, hour: '13.00', degree: '23°'),
    WeatherHourlyModel(image: AppImages.cloudy, hour: '13.00', degree: '22°'),
    WeatherHourlyModel(
        image: AppImages.partialyCloudy, hour: '13.00', degree: '22°'),
    WeatherHourlyModel(
        image: AppImages.partialyCloudy, hour: '14.00', degree: '20°'),
    WeatherHourlyModel(
        image: AppImages.partialyCloudy, hour: '15.00', degree: '20°'),
    WeatherHourlyModel(
        image: AppImages.rainPartiallyCloudy, hour: '16.00', degree: '20'),
    WeatherHourlyModel(
        image: AppImages.rainPartiallyCloudy, hour: '17.00', degree: '20'),
    WeatherHourlyModel(image: AppImages.rain, hour: '18.00', degree: '19°'),
    WeatherHourlyModel(image: AppImages.rain, hour: '19.00', degree: '19°'),
    WeatherHourlyModel(image: AppImages.rain, hour: '20.00', degree: '18°'),
    WeatherHourlyModel(image: AppImages.moon, hour: '21.00', degree: '15°'),
    WeatherHourlyModel(image: AppImages.moon, hour: '23.00', degree: '14°'),
  ];

  List<WeatherDailyModel> listOfWeatherDailyModel = [
    WeatherDailyModel(
      image: AppImages.clear,
      date: 'Today',
      maxDegree: '24°',
      minDegree: '15°',
      status: 'Clear',
    ),
    WeatherDailyModel(
      image: AppImages.rainPartiallyCloudy,
      date: 'Tomorrow',
      maxDegree: '24°',
      minDegree: '15°',
      status: 'Rain, Partially cloudy',
    ),
    WeatherDailyModel(
      image: AppImages.rainPartiallyCloudy,
      date: 'WE, 24 May',
      maxDegree: '24°',
      minDegree: '15°',
      status: 'Rain, Partially cloudy',
    ),
    WeatherDailyModel(
      image: AppImages.cloudy,
      date: 'TH, 25 May',
      maxDegree: '24°',
      minDegree: '15°',
      status: 'Cloudy',
    ),
    WeatherDailyModel(
      image: AppImages.cloudy,
      date: 'FR, 26 May',
      maxDegree: '24°',
      minDegree: '15°',
      status: 'Cloudy',
    ),
    WeatherDailyModel(
      image: AppImages.rain,
      date: 'SA, 27 May',
      maxDegree: '24°',
      minDegree: '15°',
      status: 'Rain',
    ),
    WeatherDailyModel(
      image: AppImages.clear,
      date: 'SU, 28 May',
      maxDegree: '24°',
      minDegree: '15°',
      status: 'Clear',
    ),
    WeatherDailyModel(
      image: AppImages.partialyCloudy,
      date: 'MO, 29 May',
      maxDegree: '24°',
      minDegree: '15°',
      status: 'Partially cloudy',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(30.0.sp),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    // weather.location.name,
                    'Damascus',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Image.asset(
                    AppImages.location,
                    width: 24.w,
                    height: 24.h,
                    color: Theme.of(context).colorScheme.secondary,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                  width: double.infinity.w,
                  height: 189.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0.r),
                      color: Theme.of(context).colorScheme.onSecondary),
                  child: Padding(
                    padding: EdgeInsets.all(20.0.sp),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Damascus',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                '24°c',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Text(
                                '${translation(context).partially_cloudy}  Feels like 24°c',
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: Theme.of(context).textTheme.displaySmall,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(start: 10.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: const AssetImage(
                                      AppImages.partialyCloudy),
                                  width: 120.w,
                                  height: 120.h,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 150.h,
                width: double.infinity.w,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => weatherHourlyModelItem(
                        context, listOfWeatherHourlyModel[index]),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 20.w,
                        ),
                    itemCount: listOfWeatherHourlyModel.length),
              ),
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => WeatherHourlyModelItem(
                        model: listOfWeatherDailyModel[index]),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10.w,
                        ),
                    itemCount: listOfWeatherDailyModel.length),
              )
            ],
          ),
        )));
  }
}
