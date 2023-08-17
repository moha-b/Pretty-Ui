import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../onboarding/screens/widgets/custom_indicator.dart';
import '../../data/teacher_model.dart';
import 'best_teachers_card.dart';

class BestTeachers extends StatefulWidget {
  const BestTeachers({super.key});

  @override
  State<BestTeachers> createState() => _BestTeachersState();
}

class _BestTeachersState extends State<BestTeachers> {
  late PageController _pageController;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.57);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: AppSpacing.thirtyVertical),
        Text(
          'Teachers of the Week',
          style: AppTypography.kBold18,
        ),
        SizedBox(height: AppSpacing.twentyVertical),
        SizedBox(
          height: 260.h,
          child: PageView.builder(
            itemCount: bestTeachers.length,
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            itemBuilder: (context, index) {
              return BestTeachersCard(
                index: index,
                pageController: _pageController,
                teacher: bestTeachers[index],
              );
            },
          ),
        ),
        SizedBox(height: 30.h),
        CustomIndicator(
          controller: _pageController,
          dotsLength: 3,
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
