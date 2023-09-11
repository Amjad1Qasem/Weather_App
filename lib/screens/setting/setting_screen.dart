import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/blocs/localization/localization_cubit.dart';
import 'package:weather_app/blocs/theme/theme_cubit.dart';
import 'package:weather_app/constants/app_images.dart';
import 'package:weather_app/screens/widgets/toggle_buttons.dart';
import 'package:weather_app/utilities/translation.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late ThemeState themeCubitState = BlocProvider.of<ThemeCubit>(context).state;
  late String valueSelected = themeCubitState is ThemeFetched &&
          (themeCubitState as ThemeFetched).themeMode == ThemeMode.light
      ? translation(context).light
      : translation(context).dark;

  late LocalizationState localizationCubitState =
      BlocProvider.of<LocalizationCubit>(context).state;
  late String languageSelected = localizationCubitState
              is LocalizationFetched &&
          (localizationCubitState as LocalizationFetched).locale.languageCode ==
              'en'
      ? translation(context).light
      : translation(context).dark;

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
          // enabled: false,
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
                      ToggleButtonsWidget(
                        isSelected: const [true, false],
                        firstTextButton: '°C',
                        lastTextButton: '°F',
                        onPressed: (val) {
                          Null;
                        },
                      ),
                      const Spacer(),
                      ToggleButtonsWidget(
                        isSelected: const [true, false],
                        firstTextButton: 'm/s',
                        lastTextButton: 'Km/h',
                        onPressed: (val) {
                          setState(() {
                            if (val == 0) {
                            } else {}
                          });
                        },
                      ),
                      const Spacer(),
                      ToggleButtonsWidget(
                        isSelected: const [true, false],
                        firstTextButton: 'mmH',
                        lastTextButton: 'hPa',
                        onPressed: (val) {
                          setState(() {
                            if (val == 0) {
                            } else {}
                          });
                        },
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
                      ToggleButtonsWidget(
                        isSelected: [
                          (BlocProvider.of<LocalizationCubit>(context).state
                                      as LocalizationFetched)
                                  .locale
                                  .languageCode ==
                              'ar',
                          (BlocProvider.of<LocalizationCubit>(context).state
                                      as LocalizationFetched)
                                  .locale
                                  .languageCode ==
                              'en'
                        ],
                        firstTextButton: 'Ar',
                        lastTextButton: 'En',
                        onPressed: (value) {
                          setState(() {
                            if (value == 0) {
                              BlocProvider.of<LocalizationCubit>(context)
                                  .arabic();
                            } else {
                              BlocProvider.of<LocalizationCubit>(context)
                                  .english();
                            }
                          });
                        },
                      ),
                      const Spacer(),
                      DropdownButton(
                        iconSize: 0,
                        dropdownColor: Theme.of(context).scaffoldBackgroundColor,
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
                          if (newValue == translation(context).light) {
                            BlocProvider.of<ThemeCubit>(context).light();
                          } else {
                            BlocProvider.of<ThemeCubit>(context).dark();
                          }
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
