import 'package:flutter/material.dart';
import 'package:habits10/src/features/intro/presentation/widgets/progress_painter.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../../../../core/utils/app_assets.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppAssets.svg(AppAssets.icons.stars),
              Text("12", style: AppStyles.s26Bold),
              Text(
                "يوم متتالى",
                style: AppStyles.s20Bold.withColor(AppColors.tertiaryBrown),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
