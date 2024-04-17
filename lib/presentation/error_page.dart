import 'package:flutter/material.dart';

import '../util/AppColors.dart';

class ErrorPage extends StatelessWidget {

  final VoidCallback onTryAgainPressed;

  const ErrorPage({super.key, required this.onTryAgainPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/error_plant_image.jpg'),
              SizedBox(height: 16),
              Text(
                'Something went wrong. Try again later and check your internet connection',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {onTryAgainPressed();},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Try Again', style: TextStyle(color: Colors.white),),
                    ),

                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
