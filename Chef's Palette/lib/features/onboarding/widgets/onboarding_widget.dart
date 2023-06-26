import 'package:chef/core/resources/dimns.dart';
import 'package:chef/core/resources/sizes.dart';
import 'package:chef/features/onboarding/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.onBoarding,
  });
  final OnBoarding onBoarding;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(onBoarding.image,
            height: getScreenHeight(360),
            width: double.infinity,
            fit: BoxFit.cover),
        SizedBox(height: getScreenHeight(AppDimns.big)),
        Flexible(
          child: Text(
            onBoarding.title,
            style: const TextStyle(
                fontSize: 30, wordSpacing: 2, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: getScreenHeight(AppDimns.medium)),
        Flexible(
          child: Text(
            onBoarding.description,
            style: TextStyle(
                fontSize: 20, wordSpacing: 2, color: Colors.grey.shade800),
          ),
        ),
      ],
    );
  }
}
