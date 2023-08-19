import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';

import '../../data/onboarding.dart';

class OnBoardingCard extends StatelessWidget {
  final Onboarding onBoarding;
  final int index;
  const OnBoardingCard({
    required this.onBoarding,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 1400),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(onBoarding.image), fit: BoxFit.fill)),
        child: Column(
          children: [
            const Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: onBoarding.title1,
                  style: AppTypography.kLight36
                      .copyWith(color: AppColors.kSecondary),
                  children: [
                    TextSpan(
                      text: onBoarding.title2,
                      style: AppTypography.kBold36,
                    )
                  ]),
            ),
            SizedBox(height: AppSpacing.twentyVertical),
            Text(
              onBoarding.description,
              style: AppTypography.kLight16,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
