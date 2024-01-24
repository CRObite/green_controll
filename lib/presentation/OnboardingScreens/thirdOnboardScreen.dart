import 'package:flutter/material.dart';

import '../../util/AppColors.dart';
import '../../util/AppImage.dart';
import '../../util/AppText.dart';

class ThirdOnboardScreen extends StatelessWidget {
  const ThirdOnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 270,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImage.mail),
            const SizedBox(height: 16),
            Text(
              AppText.waitNotification,
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
