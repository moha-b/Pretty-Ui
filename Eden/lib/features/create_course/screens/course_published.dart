import 'package:eden/features/create_course/screens/widgets/share_course_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common/common_widgets.dart';
import '../../../core/utils/utils.dart';

class CoursePublished extends StatelessWidget {
  const CoursePublished({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(7.h),
          child: CustomIconButton(
            color: AppColors.kPrimary.withOpacity(0.08),
            icon: AppAssets.kArrowBackIos,
            onTap: () {
              Get.back<void>();
            },
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.twentyVertical),
        child: Column(
          children: [
            const Spacer(),
            Text(
              'Congratulations! You have \npublished a new course.',
              style: AppTypography.kBold24,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            PrimaryButton(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30.r),
                    ),
                  ),
                  builder: (context) {
                    return const ShareCourseSheet();
                  },
                );
              },
              text: 'Share',
            ),
          ],
        ),
      ),
    );
  }
}
