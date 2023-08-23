import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listenlit/core/utils/utils.dart';
import 'package:listenlit/features/onboarding/data/onboarding_model.dart';

class OnboardingCard extends StatelessWidget {
  final List<OnBoarding> onBoardingList;
  final int currentIndex;
  PageController pageController;

  OnboardingCard({
    Key? key,
    required this.onBoardingList,
    required this.currentIndex,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColor.kGrey3Color,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.r),
                topLeft: Radius.circular(25.r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70.h, left: 35.w, right: 34.w),
              child: Text(
                pageViewList[currentIndex].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.kLightAccentColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: DotsIndicator(
                dotsCount: pageViewList.length,
                position: currentIndex,
                decorator: DotsDecorator(
                  color: Colors.grey.withOpacity(0.5),
                  size: const Size.square(8.0),
                  activeSize: const Size(20.0, 8.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  activeColor: AppColor.kPrimary,
                ),
              ),
            ),
          ],
        ));
  }
}
