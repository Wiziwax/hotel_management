import 'package:flutter/material.dart';
import 'package:hotel_management/dashboard_screen2.dart';
import 'package:hotel_management/navigation_page.dart';
import 'package:hotel_management/occupancy_view.dart';
import 'package:hotel_management/room_manager.dart';
import 'package:hotel_management/utils/app_themes.dart';
import 'package:hotel_management/utils/sign_up_screen.dart';

import 'front_desk.dart';
import 'home_screen.dart';
import 'onboarding_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel App',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system, // Uses system preference
      home: OnboardingScreen(),
      routes: {
        '/home': (context) => NavigationPage(), // Main app screen
        '/signup': (context) => SignUpScreen(),
        '/dashboard': (context) => DashboardScreen2(),// Define your SignUpScreen widget
        '/front_desk': (context) => FrontDesk(),// Define your SignUpScreen widget
        '/room_manager': (context) => RoomManager(),// Define your SignUpScreen widget
        '/occupancy': (context) => OccupancyView()// Define your SignUpScreen widget
      },
    );
  }
}
