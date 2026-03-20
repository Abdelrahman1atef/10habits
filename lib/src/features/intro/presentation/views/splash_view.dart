import 'package:habits10/core/Router/router_names.dart';
import 'package:habits10/core/cache/cache_helper.dart';
import 'package:habits10/src/features/intro/cubit/intro_cubit.dart';
import 'package:habits10/src/features/intro/cubit/intro_state.dart';
import 'package:habits10/src/features/intro/presentation/sections/splash_body_section.dart';
import 'package:habits10/core/common/widgets/sheets/language_bottom_sheet_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    context.read<IntroCubit>().checkUserStatus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<IntroCubit, IntroState>(
      listener: (context, state) {
        if (state is ShowLanguageBottomSheetState) {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            isDismissible: false,
            enableDrag: false,
            builder: (context) => LanguageBottomSheetSection(
              onContinue: () async {
                context.pop();
                await CacheHelper.saveBool('isLanguageSelected', true);
                if (context.mounted) {
                  context.go(AppRoutes.intro);
                }
              },
            ),
          );
        } else if (state is NavigateToIntroState) {
          context.go(AppRoutes.intro);
        } else if (state is NavigateToLoginState) {
          context.go(AppRoutes.login);
        } else if (state is NavigateToMainState) {
          context.go(AppRoutes.home);
        }
      },
      child: const Scaffold(body: SplashBodySection()),
    );
  }
}
