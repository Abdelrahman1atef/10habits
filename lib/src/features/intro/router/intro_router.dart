import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habits10/core/Router/router_names.dart';
import 'package:habits10/core/locator/service_locator.dart';
import 'package:habits10/src/features/intro/cubit/intro_cubit.dart';
import 'package:habits10/src/features/intro/presentation/views/on_boarding_view.dart';
import 'package:habits10/src/features/intro/presentation/views/splash_view.dart';

class IntroRouter {
  static final List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<IntroCubit>(),
        child: const SplashView(),
      ),
    ),
    GoRoute(
      path: AppRoutes.intro,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<IntroCubit>(),
        child: const OnBoardingView(),
      ),
    ),
  ];
}
