import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/containers/primary_container.dart';
import '../../../course_detail/data/course_model.dart';

class MyCourseCard extends StatelessWidget {
  final Course course;
  const MyCourseCard({required this.course, super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppSpacing.radiusFifteen),
                ),
                image: DecorationImage(
                  image: AssetImage(course.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.all(12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.kBold16,
                  ),
                  const Spacer(),
                  Text(
                    '${course.lessons.length} Lessons',
                    style: AppTypography.kLight14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
