import 'package:flutter/material.dart';
import 'package:helia/core/resources/strings.dart';

class OnboardingBody extends StatelessWidget {
  final String image;
  const OnboardingBody({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        Container(
          padding: const EdgeInsets.all(24),
          child: const Text(
            AppStrings.onboardingText,
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
