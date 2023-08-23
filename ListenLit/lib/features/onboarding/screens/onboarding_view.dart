import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listenlit/core/utils/utils.dart';
import 'package:listenlit/features/onboarding/data/onboarding_model.dart';
import 'package:listenlit/features/onboarding/screens/widgets/onboarding_card.dart';

import '../../../core/common/primarybutton.dart';
import '../../auth/screens/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBGColor,
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding:
                EdgeInsets.only(left: 61.65.w, right: 43.75.w, top: 121.76.h),
            child: SvgPicture.asset(pageViewList[_currentIndex].image),
          )),
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                        itemCount: pageViewList.length,
                        controller: pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return OnboardingCard(
                            onBoardingList: pageViewList,
                            currentIndex: index,
                            pageController: pageController,
                          );
                        }))
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding:
            EdgeInsets.only(top: 65.h, left: 32.w, right: 32.w, bottom: 57.h),
        child: PrimaryButton(
          onTap: () {
            if (_currentIndex == pageViewList.length - 1) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: ((context) => LoginScreen())),
                (route) => false,
              );
            } else {
              pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
              );
            }
          },
          text: _currentIndex == pageViewList.length - 1
              ? 'Get Started'
              : 'Continue',
          bgColor: AppColor.kPrimary,
          borderRadius: 8,
          height: 48.h,
          width: 326.w,
          textColor: AppColor.kWhiteColor,
        ),
      ),
    );
  }
}
