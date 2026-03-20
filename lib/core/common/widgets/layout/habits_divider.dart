import 'package:flutter/material.dart';
import 'package:habits10/core/theme/app_colors.dart';
import 'package:habits10/core/utils/extensions.dart';

class HabitsDivider extends StatelessWidget {
  final double? height;
  final Color? color;

  const HabitsDivider({super.key, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color ?? AppColors.textHint.withValues(alpha: .2),
      child: SizedBox(width: context.width, height: height ?? .5),
    );
  }
}
