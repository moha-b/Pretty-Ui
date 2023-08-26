import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';

import '../../../profile/screens/legal_policy_view.dart';

class AgreeTermsTextCard extends StatelessWidget {
  const AgreeTermsTextCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: RichText(
        text: TextSpan(
          text: 'By signing up you agree to our ',
          style: AppTypography.kMedium14.copyWith(color: AppColors.kGrey70),
          children: [
            TextSpan(
              text: 'Terms',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.to<Widget>(() => const LegalPolicyView());
                },
              style:
                  AppTypography.kMedium14.copyWith(color: AppColors.kGrey100),
            ),
            TextSpan(
              text: ' and ',
              style: AppTypography.kMedium14
                  .copyWith(color: AppColors.kGrey70, fontSize: 14),
            ),
            TextSpan(
              text: 'Conditions of Use',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.to<Widget>(() => const LegalPolicyView());
                },
              style: AppTypography.kMedium14
                  .copyWith(color: AppColors.kGrey100, fontSize: 14),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
