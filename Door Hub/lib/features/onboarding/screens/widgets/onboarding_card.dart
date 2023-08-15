import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/animations/onboarding_animation.dart';
import '../../../../core/utils/app_typography.dart';
import '../../data/onboarding.dart';

class OnboardingCard extends StatefulWidget {
  final bool playAnimation;
  final Onboarding onboarding;
  const OnboardingCard(
      {required this.playAnimation, super.key, required this.onboarding});

  @override
  State<OnboardingCard> createState() => _OnboardingCardState();
}

class _OnboardingCardState extends State<OnboardingCard>
    with TickerProviderStateMixin {
  late AnimationController _slideAnimationController;
  late Animation<Offset> _slideAnimation;

  Animation<Offset> get slideAnimation => _slideAnimation;
  AnimationController get slideAnimationController => _slideAnimationController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.playAnimation) {
      _slideAnimationController.forward();
    } else {
      _slideAnimationController.animateTo(
        1,
        duration: const Duration(milliseconds: 0),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _slideAnimationController =
        OnboardingAnimations.createSlideController(this);
    _slideAnimation =
        OnboardingAnimations.openSpotsSlideAnimation(_slideAnimationController);
  }

  @override
  void dispose() {
    _slideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            widget.onboarding.image,
            width: double.maxFinite,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: 30.h),
          Text(
            widget.onboarding.title,
            style: AppTypography.kBold32,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          Text(
            widget.onboarding.description,
            style: AppTypography.kLight14,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
