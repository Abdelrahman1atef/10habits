import 'package:abher/core/common/widgets/snackbars/custom_toast_widget.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../app_strings/locale_keys.dart';

enum SnackState { success, failed }

class Alerts {
  static Future dialog(
    BuildContext context, {
    required Widget child,
    RouteSettings? routeSettings,
    EdgeInsets? insetPadding,
    AlignmentGeometry? alignment,
    Color? backgroundColor,
  }) {
    return showDialog(
      context: context,
      routeSettings: routeSettings,
      builder: (context) => Dialog(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: backgroundColor,
        insetPadding: insetPadding ?? const EdgeInsets.all(50),
        alignment: alignment,
        child: child,
      ),
    );
  }

  static Future infoDialog(
    BuildContext context, {
    required Widget child,
    RouteSettings? routeSettings,
    EdgeInsets? insetPadding,
    AlignmentGeometry? alignment,
    Color? backgroundColor,
    Widget? footer,
    String? info,
  }) {
    return showDialog(
      context: context,
      routeSettings: routeSettings,
      builder: (context) => Dialog(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: backgroundColor,
        insetPadding: insetPadding ?? const EdgeInsets.all(50),
        alignment: alignment,
        child: child,
      ),
    );
  }

  // static Future yesOrNoDialog(
  //   BuildContext context, {
  //   required String title,
  //   required String action1title,
  //   required String action2title,
  //   required Function action1,
  //   required Function action2,
  //   Widget? icon,
  //   RouteSettings? routeSettings,
  //   EdgeInsets? insetPadding,
  //   AlignmentGeometry? alignment,
  //   Color? backgroundColor,
  // }) {
  //   return showDialog(
  //     context: context,
  //     routeSettings: routeSettings,
  //     builder: (context) => alertDialog(
  //       backgroundColor,
  //       alignment,
  //       icon,
  //       title,
  //       action1,
  //       action1title,
  //       action2,
  //       action2title,
  //     ),
  //   );
  // }

  static Future bottomSheet(
    BuildContext context, {
    required Widget child,
    RouteSettings? routeSettings,
    EdgeInsets? insetPadding,
    double? height,
    AlignmentGeometry? alignment,
    Color? backgroundColor,

    Color? barrierColor,
    bool isShape = true,
  }) {
    return showModalBottomSheet(
      useRootNavigator: true,
      barrierColor: barrierColor,
      enableDrag: true,
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      elevation: 0,

      backgroundColor:
          backgroundColor ?? const Color.fromARGB(255, 255, 255, 255),
      context: context,
      builder: (context) => SafeArea(
        minimum: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isShape)
              Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            child,
          ],
        ),
      ),
    );
  }

  static Future<bool> confirmDialog(
    BuildContext context, {
    required String text,
  }) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) => AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        title: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text(LocaleKeys.no.tr()),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(LocaleKeys.yes.tr()),
          ),
        ],
      )),
    );
  }

  // static defaultError() {
  //   return SmartDialog.show(
  //     builder: (context) => SizedBox(
  //       width: 400,
  //       child: Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(25),
  //         ),
  //         child: SnackDesgin(
  //           state: SnackState.failed,
  //           text: LocaleKeys.something_went_wrong.tr(),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  static void snack({required String text, required SnackState state}) {
    BotToast.showCustomText(
      align: Alignment.center,
      onlyOne: true,
      toastBuilder: (s) => AbherToastWidget(state: state, text: text),
    );
  }
}
