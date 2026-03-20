import 'package:habits10/core/theme/app_colors.dart';
import 'package:habits10/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class SplashLogoWidget extends StatelessWidget {
  const SplashLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        image: DecorationImage(
          image: AssetImage(AppAssets.images.splash),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
