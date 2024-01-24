import 'package:flutter/material.dart';
import 'package:green_control/util/AppImage.dart';
import 'package:green_control/util/AppText.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 80),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        child: Image.asset(AppImage.logo),
                        width: 80,
                      ),
                      SizedBox(width: 16,),
                      SizedBox(
                        width: 150,
                        child: Text(AppText.greenControl, style: TextStyle(fontSize: 32),)
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
