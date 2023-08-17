import 'package:eden/features/my_courses/screens/widgets/my_course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_spacing.dart';
import '../../course_detail/data/course_model.dart';

class MyCourseList extends StatelessWidget {
  const MyCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: coursesList.length,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 150 / 215,
        crossAxisSpacing: AppSpacing.twentyHorizontal,
        mainAxisSpacing: AppSpacing.twentyVertical,
      ),
      itemBuilder: (context, index) {
        return MyCourseCard(
          course: coursesList[index],
        );
      },
    );
  }
}
