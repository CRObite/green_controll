import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_control/presentation/Widgets/CustomTextField.dart';

import '../../util/AppColors.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
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
                height: 150,
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
                height: MediaQuery.of(context).size.height - 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.0),
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
                          CustomTextField(
                            hintText: 'CRObite',
                            labelText: 'Name or Nickname',
                            controller: nameController,
                            type: TextInputType.text,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Name required"),
                            ]),),
                          const SizedBox(height: 16,),
                          CustomTextField(
                            hintText: 'appUser@gmail.com',
                            labelText: 'Email',
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Email required"),
                              EmailValidator(errorText: "Please insert a valid email")
                            ]),),
                          const SizedBox(height: 16,),
                          CustomTextField(
                            controller: passwordController,
                            labelText: 'Password',
                            hintText: 'qwerty1234',
                            type:  TextInputType.visiblePassword,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Password required"),
                            ]),
                          ),
                          const SizedBox(height: 16,),
                          CustomTextField(
                            controller: confirmController,
                            labelText: 'Confirm Password',
                            hintText: 'qwerty1234',
                            type:  TextInputType.visiblePassword,
                            validator: null
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
