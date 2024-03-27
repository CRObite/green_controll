import 'package:flutter/material.dart';
import 'package:green_control/presentation/Application.dart';
import 'package:green_control/presentation/AuthorizationPages/LoginPage.dart';
import 'package:green_control/presentation/AuthorizationPages/RegistrationPage.dart';
import 'package:green_control/presentation/GreenHousePages/AddingNewGreenHouse.dart';
import 'package:green_control/presentation/GreenHousePages/GreenHouseInfoPage.dart';
import 'package:green_control/presentation/HomePage/HomePage.dart';
import 'package:green_control/presentation/OnboardingScreens/onboardPage.dart';
import 'package:green_control/presentation/PasswordRecoveryPages/EmailFilling.dart';
import 'package:green_control/presentation/PasswordRecoveryPages/EmailVerification.dart';
import 'package:green_control/presentation/PlantPage.dart';
import 'package:green_control/presentation/SensorPages/SensorInfoPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final Map<String, WidgetBuilder> routes = {
    '/': (context) => const LoginPage(),
    '/on_board': (context) => const OnBoardPage(),
    '/registration': (context) => const RegistrationPage(),
    '/recover': (context) => const EmailFilling(),
    '/home': (context) => const HomePage(),
    '/app': (context) => const Application(),
    '/gh_info': (context) => const GreenHouseInfo(),
    '/adding_new_gh': (context) => const AddingNewGreenHouse(),
    '/plant': (context) => const PlantPage(),
    '/sensor_info': (context) => const SensorInfoPage(),
  };


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes,
    );
  }
}
