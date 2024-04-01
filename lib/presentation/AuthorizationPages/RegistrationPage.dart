
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_control/presentation/AuthorizationPages/register_bloc/register_bloc.dart';
import 'package:green_control/presentation/Widgets/CustomTextField.dart';

import '../../util/AppColors.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterBloc(),
        child: RegisterForm(),
      )
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {


  TextEditingController emailController = TextEditingController();
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    firstController.dispose();
    lastController.dispose();
    confirmController.dispose();
    passwordController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc,RegisterState>(
        listener: (context,state){
          if (state is RegisterSuccess) {
            Navigator.of(context).pushReplacementNamed('/');
          }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
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
                      height: 120,
                      width: double.infinity,
                      child: Center(
                        child: SizedBox(
                          width: 150,
                          child: Text(
                              'Sign Up',
                              style: GoogleFonts.ribeyeMarrow(
                                  textStyle: TextStyle(fontSize: 32, color: Colors.white)
                              )
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: MediaQuery.of(context).size.height - 120,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                        
                        
                              Column(
                                children: [
                        
                                  const SizedBox(height: 10,),
                                  CustomTextField(
                                    hintText: 'Kuanysh',
                                    labelText: 'FirstName',
                                    controller: firstController,
                                    type: TextInputType.text,
                                    onChanged: (){
                                      BlocProvider.of<RegisterBloc>(context).add(
                                        OnTextChanged(),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 16,),
                                  CustomTextField(
                                    hintText: 'Abdramanov',
                                    labelText: 'LastName',
                                    controller: lastController,
                                    type: TextInputType.text,
                                    onChanged:(){
                                      BlocProvider.of<RegisterBloc>(context).add(
                                        OnTextChanged(),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 16,),
                                  CustomTextField(
                                    hintText: 'appUser@gmail.com',
                                    labelText: 'Email',
                                    controller: emailController,
                                    type: TextInputType.emailAddress,
                                    onChanged:(){
                                      BlocProvider.of<RegisterBloc>(context).add(
                                        OnTextChanged(),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 16,),
                                  CustomTextField(
                                    controller: passwordController,
                                    labelText: 'Password',
                                    hintText: 'qwerty1234',
                                    type:  TextInputType.visiblePassword,
                                    onChanged:(){
                                      BlocProvider.of<RegisterBloc>(context).add(
                                        OnTextChanged(),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 16,),
                                  CustomTextField(
                                    controller: confirmController,
                                    labelText: 'Confirm Password',
                                    hintText: 'qwerty1234',
                                    type:  TextInputType.visiblePassword,
                                    onChanged:(){
                                      BlocProvider.of<RegisterBloc>(context).add(
                                        OnTextChanged(),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 16,),
                        
                                  if (state is RegisterError)
                                    Text(
                                      state.errorMessage ?? '',
                                      style: TextStyle(color: Colors.red, fontSize: 16),
                                    ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                        
                                  ElevatedButton(
                                    onPressed: (){
                                      BlocProvider.of<RegisterBloc>(context).add(
                                        RegisterButtonPressed(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          firstName: firstController.text,
                                          lastName: lastController.text,
                                          confirmPassword: confirmController.text,
                                        ),
                                      );
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
                                    child: const Text('Register', style: TextStyle(color: Colors.white, fontSize: 16)),
                                  ),
                                ],
                              ),
                        
                              Row(
                        
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Already have any account' , style: TextStyle( color: AppColors.greyColor,),),
                                  const SizedBox(width: 8,),
                                  GestureDetector(
                                      onTap: (){
                        
                                        Navigator.pushReplacementNamed(context, '/');
                                      },
                                      child: const Text('Sign In', style: TextStyle(fontWeight: FontWeight.bold),)
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        )
    );
  }
}



