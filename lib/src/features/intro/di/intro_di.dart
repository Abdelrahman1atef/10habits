import 'package:habits10/core/locator/service_locator.dart';
import 'package:habits10/src/features/intro/cubit/intro_cubit.dart';

class IntroDI {
  static void setup() {
    sl.registerFactory(() => IntroCubit());
  }
}
