import 'package:flutter/material.dart';
import 'package:green_control/presentation/Widgets/CustomTextField.dart';
import 'package:green_control/util/AppColors.dart';
import 'package:green_control/util/AppImage.dart';
import 'package:green_control/util/AppText.dart';
import 'package:green_control/util/SharedPreferencesOperator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {

    checkOnBoard();
    super.initState();
  }
  void checkOnBoard() async {
    if(! await SharedPreferencesOperator.containsOnBoardStatus()){
      Navigator.pushNamed(context, '/on_board');
    }
  }

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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Column(
                        children: [

                          const SizedBox(height: 50,),

                          const Text('Login', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 32,),
                          CustomTextField(
                            hintText: 'appUser@gmail.com',
                            labelText: 'Email',
                            controller: emailController,
                            type: TextInputType.emailAddress,),
                          const SizedBox(height: 16,),
                          CustomTextField(
                            controller: passwordController,
                            labelText: 'Password',
                            hintText: 'qwerty1234',
                            type:  TextInputType.visiblePassword,
                          ),
                          const SizedBox(height: 16,),
                          ElevatedButton(
                            onPressed: (){
                              Navigator.pushReplacementNamed(context, '/home');
                            },
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
                          const SizedBox(height: 16,),
                          Row(

                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Forgot your password?' , style: TextStyle( color: AppColors.greyColor,),),
                              const SizedBox(width: 8,),
                              GestureDetector(
                                  onTap: (){
                                    Navigator.pushNamed(context, '/recover');
                                  },
                                  child: const Text('Recover password', style: TextStyle(fontWeight: FontWeight.bold),)
                              ),
                            ],
                          )
                        ],
                      ),

                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have any account' , style: TextStyle( color: AppColors.greyColor,),),
                          const SizedBox(width: 8,),
                          GestureDetector(
                              onTap: (){
                                Navigator.pushReplacementNamed(context, '/registration');
                              },
                              child: const Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold),)
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
