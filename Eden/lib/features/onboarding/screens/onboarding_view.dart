import 'package:eden/core/common/buttons/buttons.dart';
import 'package:eden/features/onboarding/screens/widgets/custom_indicator.dart';
import 'package:eden/features/onboarding/screens/widgets/onboarding_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common/appbars/custom_back_appbar.dart';
import '../../../core/common/custom_painter/wave_card.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/app_theme.dart';
import '../data/onboarding_model.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({
    super.key,
  });

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  void initState() {
    initialization();
    super.initState();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  final PageController _pageController = PageController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(
      isDarkMode(context) ? defaultOverlay : customOverlay,
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _currentIndex > 0
          ? CustomBackAppBar(
              leadingCallback: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
            )
          : null,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              const WaveCard(),
              Positioned(
                top: 100.h,
                child: Image.asset(onboardingList[_currentIndex].image),
              ),
            ],
          ),
          SizedBox(height: 90.h),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingList.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingCard(
                  onboarding: onboardingList[index],
                );
              },
            ),
          ),
          CustomIndicator(
            controller: _pageController,
            dotsLength: onboardingList.length,
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: PrimaryButton(
              onTap: () {
                if (_currentIndex == (onboardingList.length - 1)) {
                  Get.offAllNamed<dynamic>(AppRoutes.getWelcomeRoute());
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              text: _currentIndex == (onboardingList.length - 1)
                  ? 'Get Started'
                  : 'Continue',
            ),
          ),
          CustomTextButton(
            onPressed: () {
              if (_currentIndex == (onboardingList.length - 1)) {
                Get.offAllNamed<dynamic>(AppRoutes.getSignInRoute());
              } else {
                Get.offAllNamed<dynamic>(AppRoutes.getWelcomeRoute());
              }
            },
            text: _currentIndex == (onboardingList.length - 1)
                ? 'Sign in instead'
                : 'Skip',
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
