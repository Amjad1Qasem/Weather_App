// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/localization/localization_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/blocs/theme/theme_cubit.dart';
import 'package:weather_app/router/app_router.dart';
import 'package:weather_app/themes/app_themes.dart';
import 'package:weather_app/translation/app_translations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LocalizationCubit()),
          BlocProvider(create: (context) => ThemeCubit()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, child) {
            final ThemeState themeState = context.watch<ThemeCubit>().state;
            final LocalizationState localizationState =
                context.watch<LocalizationCubit>().state;
            if (themeState is! ThemeFetched ||
                localizationState is! LocalizationFetched) {
              return const SizedBox();
            }
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              locale: localizationState.locale,
              themeMode: themeState.themeMode,
              supportedLocales: AppTranslation.all,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              routerConfig: AppRouter().router,
            );
          },
        ));
  }
}
