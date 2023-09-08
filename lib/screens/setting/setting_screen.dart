import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/blocs/theme/theme_cubit.dart';
import 'package:weather_app/constants/app_images.dart';
import 'package:weather_app/utilities/translation.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // late ThemeState themeCubitState = BlocProvider.of<ThemeCubit>(context).state;
  // late bool valueSelected = themeCubitState is ThemeFetched &&
  //     (themeCubitState as ThemeFetched).themeMode == ThemeMode.light;
  List<bool> isSelectedDegree = [true, false];
  List<bool> isSelectedWind = [true, false];
  List<bool> isSelectedPressure = [true, false];
  List<bool> isSelectedLanguage = [true, false];
  // List<bool> valueSelected = [true, false,false];
  String valueSelected = 'Light';
  bool isSelectedDetails = false;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: translation(context).light,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translation(context).light,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Image(
                image: const AssetImage(AppImages.clear),
                width: 30.w,
                height: 30.h,
              )
            ],
          )),
      DropdownMenuItem(
          value: translation(context).dark,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translation(context).dark,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Image(
                image: const AssetImage(AppImages.moon),
                width: 30.w,
                height: 30.h,
              )
            ],
          )),
      DropdownMenuItem(
          value: translation(context).system,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translation(context).system,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Image(
                image: const AssetImage(AppImages.system),
                width: 30.w,
                height: 30.h,
              )
            ],
          )),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30.0.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  translation(context).settings,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Container(
            width: double.infinity.w,
            height: 221.h,
            color: Theme.of(context).colorScheme.onSecondary,
            child: Padding(
              padding: EdgeInsets.all(30.0.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translation(context).degree,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Spacer(),
                      Text(
                        translation(context).wind,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Spacer(),
                      Text(
                        translation(context).pressure,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 31.h,
                        width: 132.w,
                        child: ToggleButtons(
                          constraints: BoxConstraints(
                              minWidth: 60.w,
                              maxWidth: 62.w,
                              minHeight: kMinInteractiveDimension),
                          isSelected: isSelectedDegree,
                          selectedColor: Colors.white,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fillColor: Theme.of(context).colorScheme.onPrimary,
                          renderBorder: true,
                          borderColor: Theme.of(context).colorScheme.onPrimary,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(6.r),
                          selectedBorderColor:
                              Theme.of(context).colorScheme.onPrimary,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child:
                                  Text('°C', style: TextStyle(fontSize: 16.sp)),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child:
                                  Text('°F', style: TextStyle(fontSize: 16.sp)),
                            ),
                          ],
                          onPressed: (int newIndex) {
                            setState(() {
                              for (int index = 0;
                                  index < isSelectedDegree.length;
                                  index++) {
                                if (index == newIndex) {
                                  isSelectedDegree[index] = true;
                                } else {
                                  isSelectedDegree[index] = false;
                                }
                              }
                            });
                          },
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 31.h,
                        width: 132.w,
                        child: ToggleButtons(
                          constraints: BoxConstraints(
                              minWidth: 60.w,
                              maxWidth: 62.w,
                              minHeight: kMinInteractiveDimension),
                          isSelected: isSelectedWind,
                          selectedColor: Colors.white,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fillColor: Theme.of(context).colorScheme.onPrimary,
                          renderBorder: true,
                          borderColor: Theme.of(context).colorScheme.onPrimary,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(6.r),
                          selectedBorderColor:
                              Theme.of(context).colorScheme.onPrimary,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Text('m/s',
                                  style: TextStyle(fontSize: 16.sp)),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Text('Km/h',
                                  style: TextStyle(fontSize: 16.sp)),
                            ),
                          ],
                          onPressed: (int newIndex) {
                            setState(() {
                              for (int index = 0;
                                  index < isSelectedWind.length;
                                  index++) {
                                if (index == newIndex) {
                                  isSelectedWind[index] = true;
                                } else {
                                  isSelectedWind[index] = false;
                                }
                              }
                            });
                          },
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 31.h,
                        width: 132.w,
                        child: ToggleButtons(
                          constraints: BoxConstraints(
                              minWidth: 60.w,
                              maxWidth: 62.w,
                              minHeight: kMinInteractiveDimension),
                          isSelected: isSelectedPressure,
                          selectedColor: Colors.white,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fillColor: Theme.of(context).colorScheme.onPrimary,
                          renderBorder: true,
                          borderColor: Theme.of(context).colorScheme.onPrimary,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(6.r),
                          selectedBorderColor:
                              Theme.of(context).colorScheme.onPrimary,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Text('mmHg',
                                  style: TextStyle(fontSize: 16.sp)),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: Text('hPa',
                                  style: TextStyle(fontSize: 16.sp)),
                            ),
                          ],
                          onPressed: (int newIndex) {
                            setState(() {
                              for (int index = 0;
                                  index < isSelectedPressure.length;
                                  index++) {
                                if (index == newIndex) {
                                  isSelectedPressure[index] = true;
                                } else {
                                  isSelectedPressure[index] = false;
                                }
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            width: double.infinity.w,
            height: 221.h,
            color: Theme.of(context).colorScheme.onSecondary,
            child: Padding(
              padding: EdgeInsets.all(30.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translation(context).language,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Spacer(),
                      Text(
                        translation(context).theme,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Spacer(),
                      Text(
                        translation(context).show_details,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 31.h,
                        width: 132.w,
                        child: ToggleButtons(
                          constraints: BoxConstraints(
                              minWidth: 60.w,
                              maxWidth: 62.w,
                              minHeight: kMinInteractiveDimension),
                          isSelected: isSelectedLanguage,
                          selectedColor: Colors.white,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fillColor: Theme.of(context).colorScheme.onPrimary,
                          renderBorder: true,
                          borderColor: Theme.of(context).colorScheme.onPrimary,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(6.r),
                          selectedBorderColor:
                              Theme.of(context).colorScheme.onPrimary,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child:
                                  Text('EN', style: TextStyle(fontSize: 16.sp)),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child:
                                  Text('AR', style: TextStyle(fontSize: 16.sp)),
                            ),
                          ],
                          onPressed: (int newIndex) {
                            setState(() {
                              for (int index = 0;
                                  index < isSelectedLanguage.length;
                                  index++) {
                                if (index == newIndex) {
                                  isSelectedLanguage[index] = true;
                                } else {
                                  isSelectedLanguage[index] = false;
                                }
                              }
                            });
                          },
                        ),
                      ),
                      const Spacer(),
                      DropdownButton(
                        iconSize: 0,
                        underline: Container(
                          color: Theme.of(context).colorScheme.onSecondary,
                          width: 5.w,
                          height: 0.5.h,
                        ),
                        items: dropdownItems,
                        value: valueSelected,
                        onChanged: (String? newValue) {
                          setState(() {
                            valueSelected = newValue!;
                          });
                        },
                      ),
                      const Spacer(),
                      Container(
                        width: 56,
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: isSelectedDetails
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.onTertiary,
                            ),
                            borderRadius: BorderRadius.circular(20.r)),
                        child: CupertinoSwitch(
                          activeColor:
                              Theme.of(context).colorScheme.onSecondary,
                          thumbColor: isSelectedDetails
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onTertiary,
                          trackColor: Theme.of(context).colorScheme.onSecondary,
                          value: isSelectedDetails,
                          onChanged: (value) =>
                              setState(() => isSelectedDetails = value),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
