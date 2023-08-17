import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/lessons_model.dart';

class LessonCard extends StatelessWidget {
  final Lessons lesson;
  final int index;
  const LessonCard({required this.index, required this.lesson, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            color: lesson.isPaid
                ? Colors.grey.withOpacity(0.3)
                : AppColors.kPrimary,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(
            lesson.isPaid ? Icons.lock_clock_outlined : Icons.play_arrow,
            color: AppColors.kWhite,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lesson.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.kBold16,
              ),
              SizedBox(height: 5.h),
              Text(
                'Lesson ${index + 1}  •  ${lesson.duration}',
                style: AppTypography.kLight14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
