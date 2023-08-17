import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_typography.dart';
import '../../data/onboarding_model.dart';

class OnboardingCard extends StatelessWidget {
  final Onboarding onboarding;
  const OnboardingCard({
    required this.onboarding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 500),
          child: Text(
            onboarding.title,
            style: AppTypography.kBold32,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10.h),
        FadeInUp(
          duration: const Duration(milliseconds: 500),
          child: Text(
            onboarding.description,
            style: AppTypography.kLight16,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
