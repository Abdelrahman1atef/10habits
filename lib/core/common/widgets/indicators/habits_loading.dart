import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lottie/lottie.dart';

class HabitsLoading {
  static bool shown = false;

  static void show({bool fullScreen = false}) {
    if (!shown) {
      SmartDialog.show(
        keepSingle: true,
        builder: (_) => fullScreen
            ? const HabitsCircularProgressIndicator()
            : const Dialog(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: HabitsCircularProgressIndicator(),
                ),
              ),
      );
      shown = true;
    }
  }

  static void dismis() {
    if (shown) {
      SmartDialog.dismiss();
      shown = false;
    }
  }
}

class HabitsCircularProgressIndicator extends StatelessWidget {
  const HabitsCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class HabitsSuccess {
  static bool shown = false;

  static void show({bool fullScreen = false}) {
    if (shown == false) {
      SmartDialog.show(
        // clickMaskDismiss: false,
        // animationType: SmartAnimationType.scale,
        // animationTime: const Duration(milliseconds: 100),
        keepSingle: true,
        builder: (_) => fullScreen
            ? const HabitsSuccessWidget()
            : const Dialog(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: HabitsSuccessWidget(),
                ),
              ),
      );

      shown = true;
    }
  }

  static void dismis() {
    if (shown) {
      SmartDialog.dismiss();
      shown = false;
    }
  }
}

class HabitsSuccessWidget extends StatefulWidget {
  const HabitsSuccessWidget({super.key});

  @override
  State<HabitsSuccessWidget> createState() => _HabitsSuccessWidgetState();
}

class _HabitsSuccessWidgetState extends State<HabitsSuccessWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      HabitsSuccess.dismis();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset("assets/json/success.json"));
  }
}
