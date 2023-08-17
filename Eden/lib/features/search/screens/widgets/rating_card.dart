import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';

class RatingCard extends StatelessWidget {
  final String icon;
  const RatingCard({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.kPrimary.withOpacity(0.15),
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
