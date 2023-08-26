import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';

import '../../data/onboarding.dart';

class OnboardingCard extends StatelessWidget {
  final Onboarding onboarding;
  const OnboardingCard({required this.onboarding, super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 1400),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            onboarding.title,
            textAlign: TextAlign.center,
            style: AppTypography.kSemiBold24.copyWith(color: AppColors.kWhite),
          ),
          SizedBox(height: AppSpacing.tenVertical),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Text(
              onboarding.info,
              textAlign: TextAlign.center,
              style: AppTypography.kMedium14.copyWith(color: AppColors.kWhite),
            ),
          ),
        ],
      ),
    );
  }
}
