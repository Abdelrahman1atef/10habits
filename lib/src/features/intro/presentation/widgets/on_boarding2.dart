import 'package:flutter/material.dart';
import 'package:habits10/core/utils/extensions.dart';
import 'package:habits10/src/features/intro/presentation/widgets/progress_painter.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../../../../core/utils/app_assets.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppAssets.lottie(
              AppAssets.lotties.quran,
              height: 50,
              repeat: false,
            ),
            Text(
              "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ",
              style: AppStyles.quranText.withColor(AppColors.primary),
            ),
            10.ph,
            Text(
              "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ (1) الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ (2) الرَّحْمَنِ الرَّحِيمِ (3) مَالِكِ يَوْمِ الدِّينِ (4) إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ",
              style: AppStyles.quranText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

