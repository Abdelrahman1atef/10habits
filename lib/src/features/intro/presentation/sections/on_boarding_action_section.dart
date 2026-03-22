import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits10/core/common/widgets/buttons/habits_button.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../cubit/intro_cubit.dart';

class OnBoardingActionSection extends StatelessWidget {
  const OnBoardingActionSection({
    super.key,
    required this.controller,
    required this.isLastPage,
  });

  final PageController controller;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: HabitsButton(
            onPressed: () {
              if (isLastPage) {
                // context.read<IntroCubit>().completeIntro();
                print("OnBoarding is done");
                return;
              }
              controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            text: isLastPage?"ابدأ الان":"التالى",
          ),
        ),
        IconButton(
          onPressed: () {
            controller.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
        ),
      ],
    );
  }
}
