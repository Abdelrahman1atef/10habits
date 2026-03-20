import 'package:flutter/material.dart';
import 'package:habits10/core/theme/app_colors.dart';
import 'package:habits10/core/theme/app_typography.dart';
import 'package:habits10/core/utils/extensions.dart';

import '../images/habits_image.dart';

class HabitsPriceTag extends StatelessWidget {
  final String price;
  const HabitsPriceTag({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 3,
      children: [
        Text(
          price,
          style: AppStyles.s14Medium.copyWith(color: AppColors.secondary),
        ),
        HabitsImage('riyal'.svg(), width: 15, height: 15),
      ],
    );
  }
}
