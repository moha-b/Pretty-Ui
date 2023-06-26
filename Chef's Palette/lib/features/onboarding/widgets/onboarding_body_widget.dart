import 'package:chef/core/resources/colors.dart';
import 'package:chef/core/resources/dimns.dart';
import 'package:chef/core/resources/images.dart';
import 'package:chef/core/resources/sizes.dart';
import 'package:chef/features/home/home_screen.dart';
import 'package:chef/features/onboarding/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'onboarding_widget.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    bool isLastPage = false;
    onNext() {
      controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      if (isLastPage) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
      }
    }

    onSkip() {
      controller.jumpToPage(2);
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppDimns.medium),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton.outlined(
                  onPressed: () {},
                  color: AppColors.background,
                  icon:
                      SvgPicture.asset(AppImages.arrowLeft, fit: BoxFit.cover),
                ),
                InkWell(
                  onTap: () => onSkip(),
                  child: Container(
                    padding: const EdgeInsets.all(AppDimns.medium),
                    alignment: Alignment.centerRight,
                    child: const Text("Skip"),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                  controller: controller,
                  onPageChanged: (value) {
                    isLastPage = value == 2;
                  },
                  itemBuilder: (context, index) =>
                      OnboardingWidget(onBoarding: onboardingList[index]),
                  itemCount: onboardingList.length),
            ),
            SizedBox(
              width: double.infinity,
              height: getScreenHeight(50),
              child: OutlinedButton(
                  onPressed: () => onNext(),
                  child: const Text(
                    "Next",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ),
            SizedBox(height: getScreenHeight(AppDimns.big)),
          ],
        ),
      ),
    );
  }
}
