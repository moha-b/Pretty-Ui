import 'package:eden/core/utils/utils.dart';
import 'package:eden/features/schedule/screens/widgets/date_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/buttons/custom_icon_button.dart';
import '../../course_detail/data/course_model.dart';
import '../../home/screens/widgets/course_card.dart';

class CourseSchedule extends StatefulWidget {
  const CourseSchedule({super.key});

  @override
  State<CourseSchedule> createState() => _CourseScheduleState();
}

class _CourseScheduleState extends State<CourseSchedule> {
  int selectedDate = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Classes'),
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: AppAssets.kCalendar,
          ),
          SizedBox(width: AppSpacing.twentyHorizontal),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.h),
            SizedBox(
              height: 85.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: AppSpacing.twentyHorizontal),
                itemBuilder: (context, index) {
                  return DateCard(
                    onTap: () {
                      selectedDate = index;
                      setState(() {});
                    },
                    selectedIndex: selectedDate == index,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: AppSpacing.twentyHorizontal,
                ),
                itemCount: 6,
              ),
            ),
            SizedBox(height: AppSpacing.thirtyVertical),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 20.h,
                          width: AppSpacing.twentyHorizontal,
                          padding: EdgeInsets.all(5.h),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.kWhite,
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.kPrimary,
                            ),
                          ),
                        ),
                        Container(
                          width: 6.w,
                          height: 320.h,
                          color: AppColors.kPrimary,
                        ),
                      ],
                    ),
                    SizedBox(width: AppSpacing.twentyHorizontal),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('10:00 - 10:30pm', style: AppTypography.kBold14),
                          SizedBox(height: 23.h),
                          SizedBox(
                            height: 280.h,
                            width: double.maxFinite,
                            child: CourseCard(
                              course: coursesList[0],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
