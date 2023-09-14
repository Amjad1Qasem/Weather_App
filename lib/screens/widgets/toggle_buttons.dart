import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/blocs/localization/localization_cubit.dart';

class ToggleButtonsWidget extends StatefulWidget {
  ToggleButtonsWidget(
      {super.key,
       this.onPressed,
      required this.firstTextButton,
      required this.isSelected,
      required this.lastTextButton});
   List<bool> isSelected = [true, false];
  String firstTextButton;
  String lastTextButton;
   Function(int)? onPressed;

  @override
  State<ToggleButtonsWidget> createState() => _ToggleButtonsWidgetState();
}

class _ToggleButtonsWidgetState extends State<ToggleButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 31.h,
      width: 132.w,
      child: ToggleButtons(
        constraints: BoxConstraints(
            minWidth: 60.w,
            maxWidth: 63.w,
            minHeight: kMinInteractiveDimension),
        isSelected: widget.isSelected,
        selectedColor: Colors.white,
        color: Theme.of(context).colorScheme.onPrimary,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        renderBorder: true,
        borderColor: Theme.of(context).colorScheme.onPrimary,
        borderWidth: 1,
        borderRadius: BorderRadius.circular(6.r),
        selectedBorderColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: widget.onPressed,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.sp),
            child:
                Text(widget.firstTextButton, style: TextStyle(fontSize: 16.sp)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.sp),
            child:
                Text(widget.lastTextButton, style: TextStyle(fontSize: 16.sp)),
          ),
        ],
      ),
    );
  }
}
