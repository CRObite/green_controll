import 'package:flutter/material.dart';
import 'package:green_control/presentation/AuthorizationPages/LoginPage.dart';
import 'package:green_control/presentation/OnboardingScreens/onboardPage.dart';


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
  };


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/on_board',
      routes: routes,
    );
  }
}
