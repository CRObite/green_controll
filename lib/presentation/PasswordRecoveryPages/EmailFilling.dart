import 'package:flutter/material.dart';
import 'package:green_control/util/AppColors.dart';

import '../Widgets/CustomTextField.dart';

class EmailFilling extends StatefulWidget {
  const EmailFilling({super.key});

  @override
  State<EmailFilling> createState() => _EmailFillingState();
}

class _EmailFillingState extends State<EmailFilling> {

  TextEditingController emailController = TextEditingController();

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
        title: const Text('Forgot Password', style: TextStyle(fontSize: 32, color: Colors.white)),
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
                        const Text('Mail Address Here',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                        const SizedBox(height: 8,),
                        Text('Enter the email address of the account you have access to',textAlign: TextAlign.center,style: TextStyle(color: AppColors.greyColor),),
                        const SizedBox(height: 16,),
                        CustomTextField(
                          hintText: 'appUser@gmail.com',
                          labelText: 'Email',
                          controller: emailController,
                          type: TextInputType.emailAddress,),
                        const SizedBox(height: 16,),

                        const SizedBox(height: 16,),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, '/emailVerify');
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
                          child: const Text('Recover', style: TextStyle(color: Colors.white, fontSize: 16)),
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
