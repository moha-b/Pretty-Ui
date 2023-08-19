import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';

class IngredientCard extends StatelessWidget {
  final String image;
  const IngredientCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 60.w,
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.kLightPink2,
      ),
      child: Image.asset(image),
    );
  }
}
