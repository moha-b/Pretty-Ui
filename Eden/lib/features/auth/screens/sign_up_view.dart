import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common/common_widgets.dart';
import '../../onboarding/screens/widgets/custom_indicator.dart';
import 'widgets/auth_widgets.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  late AnimationController rippleController;
  late AnimationController scaleController;
  late Animation<double> rippleAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    rippleController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    scaleController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Get.offAllNamed<dynamic>(AppRoutes.getLandingPageRoute());
            }
          });

    rippleAnimation =
        Tween<double>(begin: 80.0, end: 90.0).animate(rippleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              rippleController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              rippleController.forward();
            }
          });

    scaleAnimation =
        Tween<double>(begin: 1.0, end: 30.0).animate(scaleController);

    rippleController.forward();
  }

  @override
  void dispose() {
    rippleController.dispose();
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomBackAppBar(
        leadingCallback: () {
          if (_currentIndex > 0) {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastLinearToSlowEaseIn,
            );
          } else {
            Get.back<void>();
          }
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                WaveCard(height: 495.h),
                PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  children: [
                    UserTypeView(
                      onUserTypeSelected: (userType) {},
                    ),
                    SetupStoreView(
                      onChanged: (value) {},
                    ),
                    FascinateView(
                      onChanged: (categories) {},
                    ),
                    const SetupCompleteView(),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: AppSpacing.thirtyVertical),
          CustomIndicator(
            controller: _pageController,
            dotsLength: 4,
          ),
          SizedBox(height: AppSpacing.tenVertical),
          Padding(
            padding: EdgeInsets.all(AppSpacing.twentyVertical),
            child: _currentIndex < 3
                ? PrimaryButton(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      Future<void>.delayed(const Duration(milliseconds: 500))
                          .then(
                        (value) => {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                          ),
                        },
                      );
                    },
                    text: 'Continue',
                  )
                : AnimatedBuilder(
                    animation: scaleAnimation,
                    builder: (context, child) => Transform.scale(
                      scale: scaleAnimation.value,
                      child: PrimaryButton(
                        onTap: () {
                          scaleController.forward();
                        },
                        text: scaleController.isAnimating ||
                                scaleController.isCompleted
                            ? ''
                            : 'Continue',
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
