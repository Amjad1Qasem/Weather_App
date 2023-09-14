import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/class.dart';

class weatherHourlyModelItem extends StatefulWidget {
  const weatherHourlyModelItem(
      {super.key, required this.model, required this.isCelios});
  final WeatherHourlyModel model;
  final bool isCelios;

  @override
  State<weatherHourlyModelItem> createState() => _weatherHourlyModelItemState();
}

class _weatherHourlyModelItemState extends State<weatherHourlyModelItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      child: Column(
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
                width: 32.w,
                height: 32.h,
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            widget.model.hour.split(' ').last,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            widget.isCelios
                ? '${widget.model.tempc.truncate()}°'
                : '${widget.model.tempf.truncate()}',
            maxLines: 2,
            style: Theme.of(context).textTheme.labelMedium,
          )
        ],
      ),
    );
  }
}
