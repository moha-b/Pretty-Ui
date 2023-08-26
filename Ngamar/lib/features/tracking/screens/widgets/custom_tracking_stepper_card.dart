import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngamar/core/core.dart';

class CustomTrackingStepperCard extends StatelessWidget {
  final String icon;
  final Color? color;
  const CustomTrackingStepperCard({required this.icon, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color ?? AppColors.kWhite,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.kLine,
        ),
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
