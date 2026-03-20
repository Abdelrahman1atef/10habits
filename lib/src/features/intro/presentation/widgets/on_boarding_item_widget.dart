import 'package:flutter/material.dart';
import 'package:habits10/core/app_strings/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.auto_graph, size: 100, color: Colors.green),
        const SizedBox(height: 20),
        Text(
          AppStrings.onboardingTitle.tr(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 10),
        const Text(
          'Track your Islamic habits daily and complete the 21-day challenge.',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
