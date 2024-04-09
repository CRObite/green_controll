import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_control/presentation/PasswordRecoveryPages/email_verification_bloc/email_verification_bloc.dart';
import 'package:green_control/presentation/Widgets/CustomAppBar.dart';
import 'package:green_control/presentation/Widgets/CustomTextField.dart';
import 'package:green_control/presentation/Widgets/OtpForm.dart';

import 'package:green_control/util/AppColors.dart';


class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key, required this.email});

  final String email;

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: CustomAppBar(
          title: 'Email Verification',
        ),
      ),

      body: BlocProvider(
        create: (context) => EmailVerificationBloc(),
        child: EmailVerificationForm(email: widget.email,),
      )
    );
  }
}


class EmailVerificationForm extends StatefulWidget {
  const EmailVerificationForm({super.key, required this.email});

  final String email;

  @override
  State<EmailVerificationForm> createState() => _EmailVerificationFormState();
}

class _EmailVerificationFormState extends State<EmailVerificationForm> {

  TextEditingController confirmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late GlobalKey<OtpFormState> _otpFormKey;

  @override
  void initState() {
    super.initState();
    _otpFormKey = GlobalKey<OtpFormState>();
  }


  @override
  void dispose() {
    confirmController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailVerificationBloc,EmailVerificationState>(
      listener: (context,state){
        if (state is EmailVerificationSuccess) {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        }
      },
        child: BlocBuilder<EmailVerificationBloc,EmailVerificationState>(
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
                    const SizedBox(
                      height: 150,
                      width: double.infinity,

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
                                const Text('Get Your Code',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                                const SizedBox(height: 8,),
                                Text('Enter your 4 digit code that was sent to the email address: abdramanovkuanys@gmail.com',textAlign: TextAlign.center,style: TextStyle(color: AppColors.greyColor),),
                                const SizedBox(height: 16,),
                                OtpForm(
                                  key: _otpFormKey,
                                ),
                                const SizedBox(height: 16,),

                                const Text('Enter New Password',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                                const SizedBox(height: 8,),
                                Text('The new password must be different from the existing one',textAlign: TextAlign.center,style: TextStyle(color: AppColors.greyColor),),
                                const SizedBox(height: 16,),
                                CustomTextField(
                                  controller: passwordController,
                                  labelText: 'New Password',
                                  hintText: 'qwerty1234',
                                  type:  TextInputType.visiblePassword,
                                  onChanged:(){
                                    BlocProvider.of<EmailVerificationBloc>(context).add(
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
                                    BlocProvider.of<EmailVerificationBloc>(context).add(
                                      OnTextChanged(),
                                    );
                                  },
                                ),
                                const SizedBox(height: 16,),
                                if (state is EmailVerificationError)
                                  Text(
                                    state.errorMessage,
                                    style: TextStyle(color: Colors.red, fontSize: 16),
                                  ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const SizedBox(height: 16,),
                                ElevatedButton(
                                  onPressed: () {
                                    String otpCode = _otpFormKey.currentState!.getOtpCode();
                                    BlocProvider.of<EmailVerificationBloc>(context).add(
                                      EmailVerificationButtonPressed(
                                        email: widget.email,
                                        code: otpCode,
                                        password: passwordController.text,
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
                                  child: const Text('Continue', style: TextStyle(color: Colors.white, fontSize: 16)),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
    );
  }
}


