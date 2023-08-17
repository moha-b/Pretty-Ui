import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common/containers/primary_container.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../saved_controller.dart';
import '../../../course_detail/data/course_model.dart';

class SavedIcon extends StatelessWidget {
  final Course course;
  const SavedIcon({required this.course, super.key});

  @override
  Widget build(BuildContext context) {
    final savedController = Get.put(SavedController());

    return Obx(() {
      final isSaved = savedController.isSavedCourse(course);
      return GestureDetector(
        onTap: () {
          if (isSaved) {
            savedController.removeFromSaved(course);
          } else {
            savedController.addToSaved(course);
          }
        },
        child: PrimaryContainer(
          padding: EdgeInsets.all(12.h),
          color: AppColors.kPrimary.withOpacity(0.08),
          child: Icon(
            isSaved ? Icons.bookmark : Icons.bookmark_border,
            color: AppColors.kPrimary,
          ),
        ),
      );
    });
  }
}
