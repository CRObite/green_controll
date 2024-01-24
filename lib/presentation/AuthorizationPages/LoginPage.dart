import 'package:flutter/material.dart';
import 'package:green_control/presentation/Widgets/CustomTextField.dart';
import 'package:green_control/util/AppColors.dart';
import 'package:green_control/util/AppImage.dart';
import 'package:green_control/util/AppText.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/leaf.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 80,
                        child: Image.asset(AppImage.logo),
                      ),
                      const SizedBox(width: 16,),
                      SizedBox(
                        width: 150,
                        child: Text(AppText.greenControl, style: const TextStyle(fontSize: 32, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height - 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Text('Login', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 32,),
                          CustomTextField(
                            hintText: 'appUser@gmail.com',
                            labelText: 'Email',
                            controller: emailController,),
                          const SizedBox(height: 16,),
                          CustomTextField(
                            controller: passwordController,
                            labelText: '',
                            hintText: '',
                          ),
                          const SizedBox(height: 16,),
                          ElevatedButton(
                            onPressed: (){},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                              minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 16)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
