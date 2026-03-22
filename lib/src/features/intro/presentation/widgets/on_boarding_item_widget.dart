import 'package:flutter/material.dart';
import 'package:habits10/core/app_strings/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';

import '../sections/on_boarding_section.dart';

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({super.key, required this.model});
  final OnBoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        model.widget,
        const SizedBox(height: 20),
        Text(
          model.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 10),
         Text(
          model.subTitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
