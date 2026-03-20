import 'package:habits10/core/common/widgets/buttons/habits_button.dart';
import 'package:habits10/core/common/widgets/sheets/habits_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DelBottomSheet extends StatelessWidget {
  final String titleKey;
  final String subKey;
  final String? delButtonKey;
  final String? icon;
  final VoidCallback onDel;

  const DelBottomSheet({
    super.key,
    required this.titleKey,
    required this.subKey,
    this.delButtonKey,
    this.icon,
    required this.onDel,
  });

  @override
  Widget build(BuildContext context) {
    return HabitsSheet(
      icon: icon ?? "del_bottom_sheet",
      title: titleKey.tr(),
      description: subKey.tr(),
      primaryButtonText: (delButtonKey ?? "del").tr(),
      primaryButtonVariant: HabitsButtonVariant.danger,
      onPrimaryPressed: () {
        context.pop();
        onDel();
      },
      secondaryButtonText: "cancel".tr(),
      secondaryButtonVariant: HabitsButtonVariant.ghost,
      onSecondaryPressed: () => context.pop(),
    );
  }
}
