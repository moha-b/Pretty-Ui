import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/buttons/custom_text_button.dart';
import '../../../course_detail/data/course_model.dart';
import 'course_card.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Trending Courses', style: AppTypography.kBold18),
            const Spacer(),
            CustomTextButton(
              onPressed: () {},
              text: 'See All',
              color: AppColors.kSecondary.withOpacity(0.3),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.twentyVertical),
        SizedBox(
          height: 280.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) {
              return CourseCard(
                course: coursesList[index],
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 30.w),
            itemCount: coursesList.length,
          ),
        ),
      ],
    );
  }
}
