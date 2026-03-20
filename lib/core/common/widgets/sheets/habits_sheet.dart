import 'package:habits10/core/common/widgets/buttons/habits_button.dart';
import 'package:habits10/core/common/widgets/images/habits_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habits10/core/utils/extensions.dart';

class HabitsSheet extends StatelessWidget { 
  final String title;
  final String? description;
  final String? icon;
  final Widget? iconWidget;
  final Widget? widget;

  // Primary Action
  final String? primaryButtonText;
  final VoidCallback? onPrimaryPressed;
  final HabitsButtonVariant primaryButtonVariant;

  // Secondary Action
  final String? secondaryButtonText;
  final VoidCallback? onSecondaryPressed;
  final HabitsButtonVariant secondaryButtonVariant;

  const HabitsSheet({

    super.key,
    required this.title,
    this.description,
    this.icon,
    this.iconWidget,
    this.primaryButtonText,
    this.onPrimaryPressed,
    this.primaryButtonVariant = HabitsButtonVariant.primary,
    this.secondaryButtonText,
    this.onSecondaryPressed,
    this.secondaryButtonVariant = HabitsButtonVariant.ghost,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 48),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconWidget != null)
            SizedBox(height: 62, width: 62, child: iconWidget)
          else if (icon != null)
            HabitsImage(icon!, width: 62, height: 62),

          if (icon != null || iconWidget != null) 16.ph,

          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.secondary,
            ),
            textAlign: TextAlign.center,
          ),

          if (description != null) ...[
            8.ph,
            Text(
              description!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ],
          if (widget != null) ...[25.ph, widget!],
          if (primaryButtonText != null) ...[
            22.ph,
            HabitsButton(
              text: primaryButtonText!,
              variant: primaryButtonVariant,
              onPressed: onPrimaryPressed,
            ),
          ],

          if (secondaryButtonText != null) ...[
            10.ph,
            HabitsButton(
              text: secondaryButtonText!,
              variant: secondaryButtonVariant,
              backgroundColor:
                  secondaryButtonVariant == HabitsButtonVariant.ghost
                  ? theme.colorScheme.onSurface.withValues(alpha: .05)
                  : null,
              textColor: secondaryButtonVariant == HabitsButtonVariant.ghost
                  ? theme.colorScheme.onSurfaceVariant
                  : null,
              onPressed: onSecondaryPressed ?? () => context.pop(),
            ),
          ],
        ],
      ),
    );
  }
}
