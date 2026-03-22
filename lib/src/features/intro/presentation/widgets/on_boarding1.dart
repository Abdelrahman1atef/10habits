import 'package:flutter/material.dart';
import 'package:habits10/src/features/intro/presentation/widgets/progress_painter.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../../../../core/utils/app_assets.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        width: 300,
        height: 300,
        child: AppAssets.lottie(
          AppAssets.lotties.manReadsQuran,
          height: 100,
          repeat: false,
        ),
      ),
    );
  }
}
