import 'package:eden/core/utils/utils.dart';
import 'package:eden/features/course_detail/screens/widgets/lesson_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/animations/custom_switch.dart';
import '../../../core/common/containers/primary_container.dart';
import '../data/lessons_model.dart';

class CourseLessonsView extends StatefulWidget {
  final List<Lessons> lesson;
  const CourseLessonsView({required this.lesson, super.key});

  @override
  State<CourseLessonsView> createState() => _CourseLessonsViewState();
}

class _CourseLessonsViewState extends State<CourseLessonsView> {
  bool _isDownloadAll = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 30.h),
          PrimaryContainer(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: Row(
              children: [
                Text('Download All', style: AppTypography.kLight16),
                const Spacer(),
                CustomSwitch(
                  value: _isDownloadAll,
                  onChanged: (value) {
                    setState(() {
                      _isDownloadAll = value;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          ListView.separated(
            itemBuilder: (context, index) {
              return LessonCard(
                index: index,
                lesson: widget.lesson[index],
              );
            },
            separatorBuilder: (context, index) => Divider(height: 30.h),
            itemCount: widget.lesson.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
