import 'package:flutter/material.dart';
import 'package:green_control/util/AppColors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Email', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'abdramanovkuanys@gmail.com',
                  hintStyle: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: 16
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
