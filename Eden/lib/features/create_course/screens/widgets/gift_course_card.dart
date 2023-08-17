import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../course_detail/data/course_model.dart';

class GiftCourseCard extends StatelessWidget {
  const GiftCourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: isDarkMode(context) ? Colors.black : AppColors.kWhite,
        boxShadow: [AppColors.defaultShadow],
      ),
      child: Row(
        children: [
          Container(
            height: 80.h,
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.radiusTen),
              image: DecorationImage(
                image: AssetImage(coursesList[0].image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coursesList[0].name, style: AppTypography.kBold16),
                SizedBox(height: 20.h),
                Text(
                  '${coursesList[0].lessons.length} Lessons',
                  style: AppTypography.kLight14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
