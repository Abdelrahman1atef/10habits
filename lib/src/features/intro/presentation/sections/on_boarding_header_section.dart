import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_typography.dart';

class OnBoardingHeaderSection extends StatelessWidget {
  const OnBoardingHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "تخطى",
            style: AppStyles.s14Bold.withColor(AppColors.primary),
          ),
        ),
      ],
    );
  }
}
