import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:habits10/core/Router/router_names.dart';
import 'package:habits10/core/theme/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../services/alerts.dart';

class HabitsPaymentWebView extends StatefulWidget {
  final String url;

  const HabitsPaymentWebView({super.key, required this.url});

  @override
  State<HabitsPaymentWebView> createState() => _HabitsPaymentWebViewState();
}

class _HabitsPaymentWebViewState extends State<HabitsPaymentWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'pay'.tr(),
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
            fontSize: 16.0,
          ),
        ),
      ),
      body: SafeArea(
        child: WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  // Update loading bar.
                },
                onPageStarted: (String url) {},
                onPageFinished: (String url) {},
                onWebResourceError: (WebResourceError error) {
                  debugPrint('''
          Page resource error:
        code: ${error.errorCode}
        description: ${error.description}
        errorType: ${error.errorType}
        isForMainFrame: ${error.isForMainFrame}
              ''');
                },
                onNavigationRequest: (NavigationRequest request) {
                  return NavigationDecision.navigate;
                },

                onUrlChange: (UrlChange change) async {
                  if (change.url?.contains('message=APPROVED') == true) {
                    if (!mounted) return;
                    Alerts.snack(
                      text: 'payment_success'.tr(),
                      state: SnackState.success,
                    );

                    await Future.delayed(const Duration(seconds: 3));
                    if (!mounted) return;
                    context.go(AppRoutes.layout);
                  } else if (change.url?.contains("status=failed") == true) {
                    if (!mounted) return;
                    Alerts.snack(
                      text: 'payment_failed'.tr(),
                      state: SnackState.failed,
                    );

                    await Future.delayed(const Duration(seconds: 3));
                    if (!mounted) return;
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }
                },
              ),
            )
            ..loadRequest(Uri.parse(widget.url)),
        ),
      ),
    );
  }
}
