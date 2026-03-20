import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits10/core/Router/router_names.dart';
import 'package:habits10/src/features/intro/cubit/intro_cubit.dart';
import 'package:habits10/src/features/intro/cubit/intro_state.dart';
import 'package:go_router/go_router.dart';
import 'package:habits10/core/app_strings/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:habits10/src/features/intro/presentation/sections/on_boarding_section.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<IntroCubit, IntroState>(
      listener: (context, state) {
        if (state is IntroCompleted) {
          context.go(AppRoutes.login);
        }
      },
      child: const Scaffold(
        body: OnBoardingSection(),
      ),
    );
  }
}
