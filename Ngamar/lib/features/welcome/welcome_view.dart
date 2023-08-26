import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';

import '../auth/screens/signin_view.dart';
import '../auth/screens/signup_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.kOnboardingThird),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomGradientCard(
          gradient: AppColors.customOnboardingGradient,
          child: Column(
            children: [
              const Spacer(),
              RichText(
                text: TextSpan(
                  text: "Let's fulfill your housing needs in ",
                  style: AppTypography.kSemiBold24
                      .copyWith(color: AppColors.kWhite),
                  children: [
                    TextSpan(
                      text: 'Ngamar.',
                      style: AppTypography.kSemiBold24
                          .copyWith(color: AppColors.kPrimary),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.tenVertical),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                textAlign: TextAlign.center,
                style:
                    AppTypography.kMedium14.copyWith(color: AppColors.kWhite),
              ),
              SizedBox(height: AppSpacing.thirtyVertical),
              PrimaryButton(
                onTap: () {
                  Get.to<Widget>(() => const SignInView());
                },
                text: 'Get Started',
              ),
              SizedBox(height: AppSpacing.twentyVertical),
              RichText(
                text: TextSpan(
                  text: 'Don’t have an account? ',
                  style: AppTypography.kSemiBold16
                      .copyWith(color: AppColors.kWhite),
                  children: [
                    TextSpan(
                      text: 'Register',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to<Widget>(() => const SignUpView());
                        },
                      style: AppTypography.kSemiBold16
                          .copyWith(color: AppColors.kPrimary),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.thirtyVertical),
            ],
          ),
        ),
      ),
    );
  }
}
