import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/screens/splash.dart';

class AppRouter {


static String get splashScreen => '/splashScreen';
 


  late final GoRouter router = GoRouter(
    initialLocation: splashScreen,
    debugLogDiagnostics: kDebugMode,
    routes: [
  
      GoRoute(
          path: splashScreen,
          name: splashScreen,
          builder: (context, state) => const SplashScreen())
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
