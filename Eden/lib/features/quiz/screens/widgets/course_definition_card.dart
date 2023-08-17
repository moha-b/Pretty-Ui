import 'dart:math';

import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDefinitionCard extends StatelessWidget {
  final double currentPage;
  final int index;
  final String image;

  const CourseDefinitionCard({
    required this.currentPage,
    required this.index,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = (index - currentPage).abs().clamp(0.0, 1.0);
    final isCenterCard = index == currentPage.round();

    return Transform.rotate(
      angle: pi * value,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 250.h,
            width: 200.w,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/constrast.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              [
                'Repetition',
                'Contrast',
                'Symmetry',
              ][index],
              style: AppTypography.kBold20.copyWith(color: AppColors.kWhite),
            ),
          ),
          if (isCenterCard)
            Container(
              height: 40.h,
              width: 40.w,
              margin: EdgeInsets.only(top: 251.h),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kPrimary,
              ),
              child: const Icon(
                Icons.check,
                color: AppColors.kWhite,
              ),
            ),
        ],
      ),
    );
  }
}
