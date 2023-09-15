import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/constants/app_images.dart';
import 'package:weather_app/controllers/controller.dart';
import 'package:weather_app/controllers/weather_daily_controller.dart';
import 'package:weather_app/models/class.dart';
import 'package:weather_app/screens/search/search_screen.dart';
import 'package:weather_app/screens/widgets/weather_day.dart';
import 'package:weather_app/screens/widgets/weather_hour.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  late SharedPreferences tempIsCele;
  bool isCelios = false;

  void initSharedPreferences() async {
    tempIsCele = await SharedPreferences.getInstance();
    if (tempIsCele.getBool('isSelTemp_0') ?? false) {
      isCelios = true;
    } else {
      isCelios = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(30.0.sp),
          child: Column(
            children: [
              FutureBuilder<WeatherCurrentModel>(
                  future: WeatherCurrentController.getCurrentWeather(
                      cityName: location),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final weather = snapshot.data!;
                    return Row(
                      children: [
                        Text(
                          weather.location.name,
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
                    );
                  }),
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
                    child: FutureBuilder<WeatherCurrentModel>(
                        future: WeatherCurrentController.getCurrentWeather(
                            cityName: location),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          final weather = snapshot.data!;
                          return Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      weather.location.localtime,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                    Text(
                                      isCelios
                                          ? '${weather.current.tempc.truncate()}°'
                                          : '${weather.current.tempf.truncate()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    Text(
                                      isCelios
                                          ? '${weather.current.condition.text}  Feels like  ${weather.current.tempc.truncate()}°'
                                          : '${weather.current.condition.text}  Feels like  ${weather.current.tempf.truncate()}',
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(start: 10.sp),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          weather.current.condition.icon,
                                        ),
                                        width: 120.w,
                                        height: 120.h,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                  )),
              SizedBox(
                height: 20.h,
              ),
              FutureBuilder(
                  future: WeatherDailyController.getDailyWeather(
                      cityNmae: location),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final weath = snapshot.data!;
                    return Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150.h,
                            width: double.infinity.w,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    weatherHourlyModelItem(
                                        isCelios: isCelios,
                                        model: weath.hours[index]),
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 20.w,
                                    ),
                                itemCount: 24),
                          ),
                          Expanded(
                            child: ListView.separated(
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) =>
                                    WeatherDailyModelItem(
                                      isCelios: isCelios,
                                      model: weath.days[index],
                                    ),
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 10.w,
                                    ),
                                itemCount: 7),
                          ),
                        ],
                      ),
                    );
                  })
            ],
          ),
        )));
  }
}
