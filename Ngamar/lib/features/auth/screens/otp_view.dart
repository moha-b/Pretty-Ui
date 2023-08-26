import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/auth/screens/widgets/widgets.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          children: [
            Text('Enter OTP', style: AppTypography.kBold24),
            SizedBox(height: AppSpacing.fiveVertical),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: RichText(
                text: TextSpan(
                  text: 'We have just sent you 4 digit code via your email ',
                  style: AppTypography.kMedium14.copyWith(
                    color: AppColors.kGrey60,
                  ),
                  children: [
                    TextSpan(
                      text: 'shameelirtaza@zeepalm.com',
                      style: AppTypography.kMedium14.copyWith(
                        color: AppColors.kGrey100,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: AppSpacing.thirtyVertical),
            CustomOTPTextField(
              onOTPInput: (value) {
                debugPrint(value);
              },
            ),
            SizedBox(height: 40.h),
            PrimaryButton(
              onTap: () {
                Get.dialog<Widget>(AgreeTermsDialog(
                  agreeCallback: () {
                    Get.back<void>();
                  },
                  disagreeCallback: () {
                    Get.back<void>();
                  },
                ));
              },
              text: 'Continue',
            ),
            SizedBox(height: AppSpacing.twentyVertical),
            RichText(
              text: TextSpan(
                text: 'Didn’t receive code? ',
                style: AppTypography.kSemiBold16
                    .copyWith(color: AppColors.kGrey60),
                children: [
                  TextSpan(
                    text: 'Resend Code',
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: AppTypography.kSemiBold16
                        .copyWith(color: AppColors.kPrimary),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
