import 'package:flutter/material.dart';
import 'package:green_control/util/AppColors.dart';
import 'package:green_control/util/AppImage.dart';
import 'package:green_control/util/AppText.dart';

class FirstOnboardScreen extends StatelessWidget {
  const FirstOnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 270,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImage.planting),
            const SizedBox(height: 16),
            Text(
              AppText.growAndCare,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.darkBlueColor,
                  fontSize: 32,),
            ),
          ],
        ),
      ),
    );
  }
}
