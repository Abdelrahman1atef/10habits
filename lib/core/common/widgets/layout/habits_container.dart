import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class HabitsContainer extends StatelessWidget {
  final Widget child;

  const HabitsContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: child,
    );
  }
}
