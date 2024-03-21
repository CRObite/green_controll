import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_control/config/validation.dart';
import 'package:green_control/data/repository/auth_repository.dart';
import 'package:green_control/domain/user/user.dart';
import 'package:green_control/presentation/AuthorizationPages/login_bloc/login_bloc.dart';
import 'package:green_control/presentation/Widgets/CustomTextField.dart';
import 'package:green_control/util/AppColors.dart';
import 'package:green_control/util/AppImage.dart';
import 'package:green_control/util/AppText.dart';
import 'package:green_control/config/SharedPreferencesOperator.dart';
import 'package:green_control/util/currentUser.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    checkOnBoard();
    super.initState();
  }

  void checkOnBoard() async {
    if (!await SharedPreferencesOperator.containsOnBoardStatus()) {
      Navigator.pushNamed(context, '/on_board');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: LoginForm(),
      )
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc,LoginState>(
        listener: (context,state){
          if (state is LoginSuccess) {
            Navigator.of(context).pushReplacementNamed('/home');
          }
        },
      child: BlocBuilder<LoginBloc,LoginState>(
        builder: (context,state){
          return SingleChildScrollView(
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
                          const SizedBox(
                            width: 16,
                          ),
                          SizedBox(
                            width: 170,
                            child: Text(AppText.greenControl,
                                style: GoogleFonts.ribeyeMarrow(
                                    textStyle: TextStyle(fontSize: 32),
                                    color: Colors.white)),
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
                      padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              const Text('Login',
                                  style: TextStyle(
                                      fontSize: 32, fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 32,
                              ),
                              CustomTextField(
                                hintText: 'appUser@gmail.com',
                                labelText: 'Email',
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                onChanged: () {
                                  BlocProvider.of<LoginBloc>(context).add(
                                    OnTextChanged(),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              CustomTextField(
                                controller: passwordController,
                                labelText: 'Password',
                                hintText: 'qwerty1234',
                                type: TextInputType.visiblePassword,
                                onChanged: () {
                                  BlocProvider.of<LoginBloc>(context).add(
                                    OnTextChanged(),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              if (state is LoginError)
                                Text(
                                  state.errorMessage ?? '',
                                  style: TextStyle(color: Colors.red, fontSize: 16),
                                ),
                              const SizedBox(
                                height: 16,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<LoginBloc>(context).add(
                                    LoginButtonPressed(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.black),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      const Size(double.infinity, 50)),
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                child: const Text('Login',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Forgot your password?',
                                    style: TextStyle(
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, '/recover');
                                      },
                                      child: const Text(
                                        'Recover password',
                                        style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have any account',
                                style: TextStyle(
                                  color: AppColors.greyColor,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/registration');
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      )
    );
  }
}

