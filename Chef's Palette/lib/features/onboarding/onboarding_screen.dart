import 'package:chef/core/resources/sizes.dart';
import 'package:chef/features/onboarding/widgets/onboarding_body_widget.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      body: OnboardingBody(),
    );
  }
}
