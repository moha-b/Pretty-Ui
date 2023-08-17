import 'package:eden/core/utils/utils.dart';
import 'package:eden/features/course_detail/screens/project_view.dart';
import 'package:eden/features/course_detail/screens/reviews_view.dart';
import 'package:eden/features/course_detail/screens/widgets/course_body_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/widgets/flexible_header.dart';
import '../data/course_model.dart';
import 'course_lessons_view.dart';

class CourseDetailView extends StatelessWidget {
  final Course course;
  const CourseDetailView({required this.course, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            FlexibleHeader(course: course),
            SliverToBoxAdapter(
              child: CourseBodyInfo(
                course: course,
              ),
            ),
            SliverPersistentHeader(
              delegate: _TabBarHeaderDelegate(
                tabBar: TabBar(
                  physics: const NeverScrollableScrollPhysics(),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 3.h,
                  indicatorPadding: EdgeInsets.only(top: 60.h),
                  labelPadding: EdgeInsets.only(top: 20.h),
                  labelStyle: AppTypography.kBold20,
                  unselectedLabelStyle: AppTypography.kBold18,
                  indicatorColor: AppColors.kAccent1,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.kAccent1,
                  ),
                  tabs: const [
                    Tab(
                      text: 'Lessons',
                    ),
                    Tab(
                      text: 'Reviews',
                    ),
                    Tab(
                      text: 'Projects',
                    ),
                  ],
                ),
              ),
              pinned: true,
            ),
            SliverFillRemaining(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  CourseLessonsView(
                    lesson: course.lessons,
                  ),
                  const ReviewsView(),
                  const ProjectView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  @override
  double get maxExtent => tabBar.preferredSize.height + 15;

  @override
  double get minExtent => tabBar.preferredSize.height + 15;
  _TabBarHeaderDelegate({required this.tabBar});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDarkMode(context) ? AppColors.kSecondary : Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_TabBarHeaderDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
