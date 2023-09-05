import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Image.asset(
            AppImages.smileCloud,
          )
        ],
      ),
    ));
  }
}
