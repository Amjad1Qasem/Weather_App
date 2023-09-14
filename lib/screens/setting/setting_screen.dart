import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      ? 'light'
      : 'dark';

  late LocalizationState localizationCubitState =
      BlocProvider.of<LocalizationCubit>(context).state;
  late String languageSelected = localizationCubitState
              is LocalizationFetched &&
          (localizationCubitState as LocalizationFetched).locale.languageCode ==
              'en'
      ? 'light'
      : 'dark';

  List<bool> isSelTemp = [true, false];
  List<bool> isSelWind = [true, false];
  List<bool> isSelPressure = [true, false];
  bool isSelectedDetails = false;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: 'light',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'light',
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
          value: 'dark',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'dark',
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

  late SharedPreferences tempIsCele;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  void initSharedPreferences() async {
    tempIsCele = await SharedPreferences.getInstance();
    setState(() {
      setState(() {
        isSelTemp[0] = tempIsCele.getBool('isSelTemp_0') ?? false;
        isSelTemp[1] = tempIsCele.getBool('isSelTemp_1') ?? true;
      });
    });
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
                        isSelected: isSelTemp,
                        firstTextButton: '°C',
                        lastTextButton: '°F',
                        onPressed: (index) {
                          setState(() {
                            if (index == 0) {
                              isSelTemp[0] = true;
                              isSelTemp[1] = false;
                              tempIsCele.setBool('isSelTemp_0', true);
                              tempIsCele.setBool('isSelTemp_1', false);
                            } else {
                              isSelTemp[0] = false;
                              isSelTemp[1] = true;
                              tempIsCele.setBool('isSelTemp_0', false);
                              tempIsCele.setBool('isSelTemp_1', true);
                            }
                          });
                        },
                      ),
                      const Spacer(),
                      ToggleButtonsWidget(
                        isSelected: isSelWind,
                        firstTextButton: 'm/s',
                        lastTextButton: 'Km/h',
                        onPressed: (index) {
                          setState(() {
                            if (index == 0) {
                              isSelWind[0] = true;
                              isSelWind[1] = false;
                            } else {
                              isSelWind[0] = false;
                              isSelWind[1] = true;
                            }
                          });
                        },
                      ),
                      const Spacer(),
                      ToggleButtonsWidget(
                        isSelected: isSelPressure,
                        firstTextButton: 'mmH',
                        lastTextButton: 'hPa',
                        onPressed: (index) {
                          setState(() {
                            if (index == 0) {
                              isSelPressure[0] = true;
                              isSelPressure[1] = false;
                            } else {
                              isSelPressure[0] = false;
                              isSelPressure[1] = true;
                            }
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
                        dropdownColor:
                            Theme.of(context).scaffoldBackgroundColor,
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
                          if (newValue == 'light') {
                            BlocProvider.of<ThemeCubit>(context).light();
                          } else {
                            BlocProvider.of<ThemeCubit>(context).dark();
                          }
                          setState(() {});
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
