import 'package:eden/features/quiz/screens/widgets/quiz_option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_typography.dart';

class QuizTwo extends StatefulWidget {
  const QuizTwo({Key? key}) : super(key: key);

  @override
  State<QuizTwo> createState() => _QuizTwoState();
}

class _QuizTwoState extends State<QuizTwo> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Question 2 of 2', style: AppTypography.kLight14),
        Text(
          'What creates space and\ndifference between elements in\nyour design? ',
          style: AppTypography.kBold24,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 50.h),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemBuilder: (context, index) {
              return QuizOptionCard(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                isSelected: selectedIndex == index,
                options: [
                  'Symmetry',
                  'Contrast',
                  'Repetition',
                  'White Space',
                ][index],
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 20.h),
            itemCount: 4,
          ),
        ),
      ],
    );
  }
}
