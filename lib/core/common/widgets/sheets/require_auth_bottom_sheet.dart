import 'package:habits10/core/common/widgets/sheets/habits_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../buttons/habits_button.dart';

class RequireAuthBottomSheet extends StatelessWidget {
  const RequireAuthBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return HabitsSheet(
      icon: 'require_auth',
      title: 'require_auth.title'.tr(),
      description: 'require_auth.sub'.tr(),
      primaryButtonText: 'require_auth.continue'.tr(),
      onPrimaryPressed: () => context.push(""), // TODO: Fix route
      secondaryButtonText: 'require_auth.cancel'.tr(),
      secondaryButtonVariant: HabitsButtonVariant.ghost,
      onSecondaryPressed: context.pop,
    );
  }
}
