import 'package:flutter/material.dart';

import '../../util/AppColors.dart';
import '../../util/AppImage.dart';
import '../../util/AppText.dart';

class SecondOnboardScreen extends StatelessWidget {
  const SecondOnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 270,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImage.observe),
            const SizedBox(height: 16),
            Text(
              AppText.observeAndRecord,
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
