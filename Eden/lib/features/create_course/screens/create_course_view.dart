import 'package:eden/core/utils/utils.dart';
import 'package:eden/features/create_course/screens/widgets/create_lessons.dart';
import 'package:eden/features/create_course/screens/widgets/publish_course_view.dart';
import 'package:eden/features/profile/screens/widgets/profile_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common/buttons/primary_button.dart';
import 'course_published.dart';

class CreateCourseView extends StatefulWidget {
  const CreateCourseView({super.key});

  @override
  State<CreateCourseView> createState() => _CreateCourseViewState();
}

class _CreateCourseViewState extends State<CreateCourseView> {
  bool _createLessons = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new course '),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20.h),
        decoration: BoxDecoration(
          color: AppColors.kPrimary.withOpacity(0.081),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40.r),
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(AppSpacing.twentyVertical),
              child: Row(
                children: [
                  ProfileImageCard(size: 50.h),
                  Expanded(
                    child: TextField(
                      controller: TextEditingController(),
                      decoration: const InputDecoration(
                        hintText: 'What does your course entail?',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.tenVertical),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 500),
              firstChild: const CreateLessons(),
              secondChild: const PublishCourseView(),
              crossFadeState: _createLessons
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: PrimaryButton(
                onTap: () {
                  if (_createLessons) {
                    setState(() {
                      _createLessons = false;
                    });
                  } else {
                    Get.to<void>(() => const CoursePublished());
                  }
                },
                text: _createLessons ? 'Continue' : 'Publish',
              ),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
