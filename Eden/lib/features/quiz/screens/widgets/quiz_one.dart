import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'course_definition_card.dart';

class QuizOne extends StatefulWidget {
  const QuizOne({
    super.key,
  });

  @override
  State<QuizOne> createState() => _QuizOneState();
}

class _QuizOneState extends State<QuizOne> {
  late PageController pageController;
  double currentPage = 0.0;

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.56);
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page ?? 0.0;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Question 1 of 2', style: AppTypography.kLight14),
        Text(
          'What creates space and\ndifference between elements\nin your design? ',
          style: AppTypography.kBold24,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 50.h),
        Expanded(
          child: PageView.builder(
            itemCount: 3,
            controller: pageController,
            itemBuilder: (context, index) {
              return CourseDefinitionCard(
                index: index,
                currentPage: currentPage,
                image: [
                  AppAssets.kRepetition,
                  AppAssets.kContrast,
                  AppAssets.kSymmetry,
                ][index],
              );
            },
          ),
        ),
      ],
    );
  }
}
