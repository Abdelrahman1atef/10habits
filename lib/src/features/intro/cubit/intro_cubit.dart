import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits10/core/cache/cache_helper.dart';
import 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroInitial());

  Future<void> checkUserStatus() async {
    await Future.delayed(const Duration(seconds: 2)); // Splash delay

    final bool isLanguageSelected = CacheHelper.getBool('isLanguageSelected') ?? false;
    final bool isIntroCompleted = CacheHelper.getBool('isIntroCompleted') ?? false;
    final String token = CacheHelper.getString('token') ?? '';

    if (!isLanguageSelected) {
      emit(ShowLanguageBottomSheetState());
    } else if (!isIntroCompleted) {
      emit(NavigateToIntroState());
    } else if (token.isEmpty) {
      emit(NavigateToLoginState());
    } else {
      emit(NavigateToMainState());
    }
  }

  void completeIntro() {
    CacheHelper.saveBool('isIntroCompleted', true);
    emit(IntroCompleted());
  }
}
