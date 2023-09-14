import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/class.dart';

class WeatherDailyModelItem extends StatefulWidget {
  const WeatherDailyModelItem({super.key, required this.model, required this.isCelios});
  final WeatherDayModel model;
  final bool isCelios;

  @override
  State<WeatherDailyModelItem> createState() => _WeatherDailyModelItemState();
}

class _WeatherDailyModelItemState extends State<WeatherDailyModelItem> {
 
  @override
  void initState() {
    super.initState();
   
  }


  late final RangeValues _value = RangeValues(
    widget.isCelios
        ? widget.model.minDegreec.roundToDouble()
        : widget.model.minDegreef.roundToDouble(),
    widget.isCelios
        ? widget.model.maxDegreec.roundToDouble()
        : widget.model.maxDegreef.roundToDouble(),
  );

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
              image: NetworkImage(widget.model.image),
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
                  widget.model.date.split(' ').first,
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
                    '${_value.start.truncate()}°',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    '${_value.end.truncate()}°',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              RangeSlider(
                values: _value,
                onChanged: (newValue) {
                  // setState(() {
                  //   _value = newValue;
                  // });
                },
                min: -20,
                max: 80,
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
