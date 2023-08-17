import 'package:eden/core/utils/utils.dart';
import 'package:eden/features/my_courses/screens/my_course_list.dart';
import 'package:eden/features/my_courses/screens/saved_course_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/buttons/custom_icon_button.dart';

class MyCoursesView extends StatelessWidget {
  const MyCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: AppSpacing.tenVertical),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSpacing.tenHorizontal),
                child: Row(
                  children: [
                    const Expanded(
                      child: TabBar(
                        physics: NeverScrollableScrollPhysics(),
                        isScrollable: true,
                        tabs: [
                          Tab(
                            text: 'My Courses',
                          ),
                          Tab(
                            text: 'Saved',
                          ),
                        ],
                      ),
                    ),
                    CustomIconButton(
                      icon: AppAssets.kFilter,
                      color: AppColors.kPrimary.withOpacity(0.15),
                      onTap: () {},
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    MyCourseList(),
                    SavedCourseList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
