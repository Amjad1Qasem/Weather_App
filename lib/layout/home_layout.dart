import 'package:flutter/material.dart';
import 'package:weather_app/screens/home/home_screen.dart';
import 'package:weather_app/screens/setting/setting_screen.dart';
import 'package:weather_app/screens/splash/splash_screen.dart';
import 'package:weather_app/utilities/translation.dart';

// ignore: must_be_immutable
class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;

  List<Widget> screens = [
    const SplashScreen(),
    HomeScreen(),
    const SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor: Theme.of(context).colorScheme.onTertiary,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: translation(context).search,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: translation(context).home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: translation(context).settings,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: screens[_currentIndex],
    );
  }
}
