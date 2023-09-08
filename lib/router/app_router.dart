import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/layout/home_layout.dart';
import 'package:weather_app/screens/home/home_screen.dart';
import 'package:weather_app/screens/search/search_screen.dart';
import 'package:weather_app/screens/setting/setting_screen.dart';
import 'package:weather_app/screens/splash/splash_screen.dart';

class AppRouter {
  static String get splashScreen => '/splashScreen';
  static String get homeScreen => '/homeScreen';
  static String get searchScreen => '/searchScreen';
  static String get settingScreen => '/settingScreen';
  static String get homeLayout => '/homeLayout';

  late final GoRouter router = GoRouter(
    initialLocation: homeLayout,
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
          path: splashScreen,
          name: splashScreen,
          builder: (context, state) => const SplashScreen()),
      GoRoute(
          path: homeScreen,
          name: homeScreen,
          builder: (context, state) => HomeScreen()),
      GoRoute(
          path: searchScreen,
          name: searchScreen,
          builder: (context, state) => const SearchScreen()),
      GoRoute(
          path: settingScreen,
          name: settingScreen,
          builder: (context, state) => const SettingScreen()),
      GoRoute(
          path: homeLayout,
          name: homeLayout,
          builder: (context, state) => HomeLayout()),
    ],
  );
}

// ignore: unused_element
class _GoRouterRefreshStream extends ChangeNotifier {
  _GoRouterRefreshStream(List<Stream> streams) {
    notifyListeners();
    _subscriptions = streams
        .map((e) => e.asBroadcastStream().listen((_) => notifyListeners()))
        .toList();
  }

  late final List<StreamSubscription> _subscriptions;

  @override
  void dispose() {
    for (var element in _subscriptions) {
      element.cancel();
    }
    super.dispose();
  }
}
