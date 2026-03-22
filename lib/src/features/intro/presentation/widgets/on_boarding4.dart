import 'package:flutter/material.dart';
import 'package:habits10/src/features/intro/presentation/widgets/progress_painter.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../../../../core/utils/app_assets.dart';

class OnBoarding4 extends StatelessWidget {
  const OnBoarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        width: 300,
        height: 300,
        child: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            CustomPaint(
              size: const Size(220, 220),
              painter: ProgressPainter(progress: .5),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppAssets.lottie(AppAssets.lotties.fireStreak, height: 100),
                Text("12", style: AppStyles.s26Bold),
                Text(
                  "يوم متتالى",
                  style: AppStyles.s20Bold.withColor(AppColors.tertiaryBrown),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
