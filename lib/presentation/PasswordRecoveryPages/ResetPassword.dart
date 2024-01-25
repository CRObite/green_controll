import 'package:flutter/material.dart';
import 'package:green_control/presentation/Widgets/CustomTextField.dart';
import 'package:green_control/util/AppColors.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController confirmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Reset Password', style: TextStyle(fontSize: 32, color: Colors.white)),
      ),
      body: Container(
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
                        const Text('EnterNewPassword',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                        const SizedBox(height: 8,),
                        Text('The new password must be different from the existing one',textAlign: TextAlign.center,style: TextStyle(color: AppColors.greyColor),),
                        const SizedBox(height: 16,),
                        CustomTextField(
                          controller: passwordController,
                          labelText: 'Password',
                          hintText: 'qwerty1234',
                          type:  TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 16,),
                        CustomTextField(
                          controller: confirmController,
                          labelText: 'Confirm Password',
                          hintText: 'qwerty1234',
                          type:  TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 16,),

                        const SizedBox(height: 16,),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.popUntil(context, ModalRoute.withName('/'));
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
  }
}
