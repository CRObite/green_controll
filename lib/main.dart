import 'package:flutter/material.dart';
import 'package:green_control/presentation/AuthorizationPages/LoginPage.dart';
import 'package:green_control/presentation/AuthorizationPages/RegistrationPage.dart';
import 'package:green_control/presentation/HomePage.dart';
import 'package:green_control/presentation/OnboardingScreens/onboardPage.dart';
import 'package:green_control/presentation/PasswordRecoveryPages/EmailFilling.dart';
import 'package:green_control/presentation/PasswordRecoveryPages/EmailVerification.dart';
import 'package:green_control/presentation/PasswordRecoveryPages/ResetPassword.dart';


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
    '/emailVerify': (context) => const EmailVerification(),
    '/resetPassword': (context) => const ResetPassword(),
    '/home': (context) => const HomePage(),
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
