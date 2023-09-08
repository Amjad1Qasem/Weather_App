import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/model/class.dart';

class WeatherInHourItem extends StatefulWidget {
  const WeatherInHourItem({super.key, required this.model});
  final WeatherInDay model;

  @override
  State<WeatherInHourItem> createState() => _WeatherInHourItemState();
}

class _WeatherInHourItemState extends State<WeatherInHourItem> {
  RangeValues _value = RangeValues(20.roundToDouble(), 40.roundToDouble());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
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
              image: AssetImage(widget.model.image),
              width: 10.w,
              height: 10.h,
            ),
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        SizedBox(
          width: 110.w,
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: 10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model.date,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  widget.model.status,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '${_value.start.toString()}°',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    '${_value.end.toString()}°',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              RangeSlider(
                values: _value,
                onChanged: (newValue) {
                  setState(() {
                    _value = newValue;
                  });
                },
                min: 5,
                max: 60,
                activeColor: const Color(0xff85B0E2),
                inactiveColor: const Color(0xff6e8096),
                onChangeEnd: (value) {
                  debugPrint('End value');
                },
                onChangeStart: (value) {
                  debugPrint('Start value');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
