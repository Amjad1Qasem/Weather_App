import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/models/class.dart';

Widget weatherHourlyModelItem(BuildContext context, WeatherHourlyModel model) =>
 Column(
      children: [
        Container(
          width: 56.w,
          height: 56.h,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(12.r)),
          child: Padding(
            padding: EdgeInsets.all(10.0.sp),
            child: Image(
              image: AssetImage(model.image),
              width: 32.w,
              height: 32.h,
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          model.hour,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          model.degree,
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
