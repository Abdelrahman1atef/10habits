import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits10/core/theme/app_colors.dart';
import 'package:habits10/core/theme/app_typography.dart';
import 'package:habits10/core/utils/app_assets.dart';
import 'package:habits10/src/features/intro/cubit/intro_cubit.dart';
import 'package:habits10/src/features/intro/presentation/sections/on_boarding_action_section.dart';
import 'package:habits10/src/features/intro/presentation/sections/on_boarding_header_section.dart';
import 'package:habits10/src/features/intro/presentation/widgets/on_boarding2.dart';
import 'package:habits10/src/features/intro/presentation/widgets/on_boarding_item_widget.dart';
import 'package:habits10/core/utils/extensions.dart';
import 'package:habits10/core/app_strings/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/on_boarding1.dart';
import '../widgets/on_boarding3.dart';
import '../widgets/on_boarding4.dart';
import '../widgets/progress_painter.dart';

class OnBoardingModel {
  final Widget widget;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.widget,
    required this.title,
    required this.subTitle,
  });
}

class OnBoardingSection extends StatefulWidget {
  const OnBoardingSection({super.key});

  @override
  State<OnBoardingSection> createState() => _OnBoardingSectionState();
}

class _OnBoardingSectionState extends State<OnBoardingSection> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<OnBoardingModel> onBoardingList = [
      OnBoardingModel(
        widget: OnBoarding1(),
        title: 'رحلتك الروحية تبدأ من هنا',
        subTitle: 'خطوة واحدة نحو حياة أكثر طمأنينة.',
      ),
      OnBoardingModel(
        widget: OnBoarding2(),
        title: 'خلوة مع القرآن والأذكار',
        subTitle: ' واجة بسيطة تساعدك على التركيز الخشوع.',
      ),
      OnBoardingModel(
        widget: OnBoarding3(),
        title: ' تتبع عبادتك اليومية',
        subTitle: 'نظم صلواتك وعاداتك في مكان واحد',
      ),
      OnBoardingModel(
        widget: OnBoarding4(),
        title: 'الاستمرارية هي السر',
        subTitle: 'حافظ على تسلسلك وافتح آفاقاً جديدة للنمو الروحي',
      ),
    ];
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 24,
        vertical: 40,
      ).copyWith(top: kToolbarHeight),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OnBoardingHeaderSection(),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (value) {
                _currentPage = value;
                setState(() {});
              },
              itemCount: onBoardingList.length,
              itemBuilder: (context, index) {
                return OnBoardingItemWidget(model: onBoardingList[index]);
              },
            ),
          ),
          40.ph,
          Builder(
            builder: (context) {
              bool isCurrentPage(index) => _currentPage == index;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onBoardingList.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: isCurrentPage(index) ? 40 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: isCurrentPage(index)
                          ? AppColors.primary
                          : AppColors.grey1,
                    ),
                  ),
                ),
              );
            },
          ),
          40.ph,
          OnBoardingActionSection(
            controller: _controller,
            isLastPage: _currentPage == (onBoardingList.length - 1),
          ),
        ],
      ),
    );
  }
}
