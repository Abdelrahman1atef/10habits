import 'package:habits10/core/utils/extensions.dart';
import 'package:flutter/material.dart';

enum HabitsButtonVariant { primary, secondary, outline, ghost, danger }

enum HabitsButtonSize {
  /// Height 36
  small,

  /// Height 50
  medium,

  /// Height 56
  large,
}

class HabitsButton extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final HabitsButtonVariant variant;
  final HabitsButtonSize size;
  final bool isLoading;
  final bool isDisabled;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  // Overrides for legacy support / special cases
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Widget? child;

  const HabitsButton({
    super.key,
    this.text,
    this.onPressed,
    this.variant = HabitsButtonVariant.primary,
    this.size = HabitsButtonSize.medium,
    this.isLoading = false,
    this.isDisabled = false,
    this.leadingIcon,
    this.trailingIcon,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.child,
    this.textStyle,
  });

  bool get _isEnabled => !isDisabled && !isLoading && onPressed != null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width,
      // height: height ?? _getHeight(),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _isEnabled ? onPressed : null,
          borderRadius: borderRadius ?? BorderRadius.circular(28),
          child: Container(
            padding: _getPadding(),
            decoration: BoxDecoration(
              color: backgroundColor ?? _getBackgroundColor(context),
              border: borderColor != null
                  ? Border.all(color: borderColor!)
                  : _getBorder(context),
              borderRadius: borderRadius ?? BorderRadius.circular(28),
            ),
            child: Center(
              child: isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _getTextColor(context),
                        ),
                      ),
                    )
                  : child ??
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (leadingIcon != null) ...[leadingIcon!, 8.ph],
                            if (text != null)
                              Text(text!, style: textStyle ?? _getTextStyle(context)),
                            if (trailingIcon != null) ...[8.ph, trailingIcon!],
                          ],
                        ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    final theme = Theme.of(context);
    if (!_isEnabled) return theme.colorScheme.onSurface.withValues(alpha: 0.12);

    switch (variant) {
      case HabitsButtonVariant.primary:
        return theme.colorScheme.primary;
      case HabitsButtonVariant.secondary:
        return theme.colorScheme.secondary;
      case HabitsButtonVariant.outline:
      case HabitsButtonVariant.ghost:
        return Colors.transparent;
      case HabitsButtonVariant.danger:
        return theme.colorScheme.error;
    }
  }

  Color _getTextColor(BuildContext context) {
    final theme = Theme.of(context);
    if (!_isEnabled) return theme.disabledColor;

    switch (variant) {
      case HabitsButtonVariant.primary:
        return theme.colorScheme.onPrimary;
      case HabitsButtonVariant.secondary:
        return theme.colorScheme.onSecondary;
      case HabitsButtonVariant.outline:
        return theme.colorScheme.primary;
      case HabitsButtonVariant.ghost:
        return theme.colorScheme.onSurface;
      case HabitsButtonVariant.danger:
        return theme.colorScheme.onError;
    }
  }

  BoxBorder? _getBorder(BuildContext context) {
    final theme = Theme.of(context);
    if (variant == HabitsButtonVariant.outline && _isEnabled) {
      return Border.all(color: theme.colorScheme.primary, width: 1.5);
    }
    return null;
  }

  TextStyle _getTextStyle(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.labelLarge!.copyWith(
      color: textColor ?? _getTextColor(context),
      fontWeight: FontWeight.bold,
    );

    switch (size) {
      case HabitsButtonSize.small:
        return style.copyWith(fontSize: 12);
      case HabitsButtonSize.medium:
        return style;
      case HabitsButtonSize.large:
        return style.copyWith(fontSize: 16);
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case HabitsButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 15);
      case HabitsButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 20);
      case HabitsButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 32, vertical: 25);
    }
  }
}
