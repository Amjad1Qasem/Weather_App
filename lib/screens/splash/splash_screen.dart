import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/constants/app_images.dart';
import 'package:weather_app/layout/home_layout.dart';
import 'package:weather_app/router/app_router.dart';
import 'package:weather_app/screens/search/search_screen.dart';
import 'package:weather_app/translation/app_translations.dart';
import 'package:weather_app/utilities/translation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.smileCloud,
              width: 144.w,
              height: 144.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              translation(context).title_splash,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              translation(context).body_splash,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
              height: 62.h,
              width: 258.w,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()),
                    );
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r)),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.onPrimary,
                      )),
                  child: Text(
                    translation(context).find_location,
                    style: Theme.of(context).textTheme.titleSmall,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
