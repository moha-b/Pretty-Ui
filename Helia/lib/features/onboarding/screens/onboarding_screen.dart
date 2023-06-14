import 'package:flutter/material.dart';
import 'package:helia/core/resources/colors.dart';
import 'package:helia/core/resources/images.dart';
import 'package:helia/core/resources/strings.dart';
import 'package:helia/features/common/button.dart';
import 'package:helia/features/onboarding/widgets/onboarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<String> images = [
    AppImages.onboarding1,
    AppImages.onboarding2,
    AppImages.onboarding3,
  ];

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: List.generate(
              3,
              (index) => OnboardingBody(image: images[index]),
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.5),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotWidth: 16,
                dotHeight: 8,
                activeDotColor: AppColors.primary,
              ),
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.7),
            child: CustomButton(
              text: AppStrings.nextButton,
              pressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.85),
            child: CustomButton(
              pressed: () {
                _pageController.jumpToPage(2);
              },
              text: AppStrings.skipButton,
              color: AppColors.secondary,
              textColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
