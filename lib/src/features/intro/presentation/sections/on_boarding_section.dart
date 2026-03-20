import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits10/src/features/intro/cubit/intro_cubit.dart';
import 'package:habits10/src/features/intro/presentation/widgets/on_boarding_item_widget.dart';
import 'package:habits10/core/utils/extensions.dart';
import 'package:habits10/core/app_strings/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';

class OnBoardingSection extends StatelessWidget {
  const OnBoardingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const OnBoardingItemWidget(),
          40.ph,
          ElevatedButton(
            onPressed: () {
              context.read<IntroCubit>().completeIntro();
            },
            child: Text(AppStrings.getStarted.tr()),
          ),
        ],
      ),
    );
  }
}
