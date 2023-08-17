import 'package:eden/features/my_courses/screens/widgets/empty_card.dart';
import 'package:eden/features/my_courses/screens/widgets/my_course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_spacing.dart';
import '../../../saved_controller.dart';

class SavedCourseList extends StatelessWidget {
  const SavedCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    final sc = Get.put(SavedController());
    return Obx(() => sc.saveCourses != null && sc.saveCourses!.isNotEmpty
        ? GridView.builder(
            itemCount: sc.saveCourses!.length,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 150 / 215,
              crossAxisSpacing: AppSpacing.twentyHorizontal,
              mainAxisSpacing: AppSpacing.twentyVertical,
            ),
            itemBuilder: (context, index) {
              return MyCourseCard(
                course: sc.saveCourses![index],
              );
            },
          )
        : const EmptyCard());
  }
}
