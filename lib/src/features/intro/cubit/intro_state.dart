import 'package:flutter/foundation.dart';

@immutable
abstract class IntroState {}

class IntroInitial extends IntroState {}

// Splash specific states
class ShowLanguageBottomSheetState extends IntroState {}
class NavigateToIntroState extends IntroState {}
class NavigateToLoginState extends IntroState {}
class NavigateToMainState extends IntroState {}

// Onboarding specific states
class IntroCompleted extends IntroState {}
