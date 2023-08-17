import 'package:eden/features/create_course/screens/widgets/price_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_spacing.dart';
import '../../../course_detail/data/course_model.dart';
import '../../../home/screens/widgets/course_card.dart';

class PublishCourseView extends StatefulWidget {
  const PublishCourseView({super.key});

  @override
  State<PublishCourseView> createState() => _PublishCourseViewState();
}

class _PublishCourseViewState extends State<PublishCourseView> {
  String selectedCurrency = r'$';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: CourseCard(
              course: coursesList[0],
            ),
          ),
          SizedBox(height: 23.h),
          PriceInputWidget(
            initialValue: selectedCurrency,
            onChanged: (value) {
              setState(() {
                selectedCurrency = value!;
              });
            },
          ),
          SizedBox(height: 70.h),
        ],
      ),
    );
  }
}
