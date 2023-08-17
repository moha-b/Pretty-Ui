import 'package:animate_do/animate_do.dart';
import 'package:eden/core/utils/utils.dart';
import 'package:eden/features/auth/screens/widgets/user_type_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/enums/user_type.dart';

class UserTypeView extends StatefulWidget {
  final void Function(UserType)? onUserTypeSelected;
  const UserTypeView({super.key, this.onUserTypeSelected});

  @override
  State<UserTypeView> createState() => _UserTypeViewState();
}

class _UserTypeViewState extends State<UserTypeView> {
  UserType userType = UserType.teacher;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 120.h),
          FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: Text(
              'Join Learn Eden as a…',
              style: AppTypography.kBold32,
            ),
          ),
          SizedBox(height: AppSpacing.tenVertical),
          FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: Text(
              'Create and sell courses as a teacher or\nbrowse courses and learn as a student.',
              style: AppTypography.kLight16,
            ),
          ),
          SizedBox(height: AppSpacing.fortyVertical),
          FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: SizedBox(
              height: 320.h,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: UserTypeCard(
                      onTap: () {
                        setState(() {
                          userType = UserType.teacher;
                        });
                        widget.onUserTypeSelected?.call(userType);
                      },
                      isSelected: userType == UserType.teacher,
                      image: AppAssets.kTeacher,
                      text: UserType.teacher.name.capitalizeFirst.toString(),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: UserTypeCard(
                      onTap: () {
                        setState(() {
                          userType = UserType.student;
                        });
                        widget.onUserTypeSelected?.call(userType);
                      },
                      isSelected: userType == UserType.student,
                      image: AppAssets.kStudent,
                      text: UserType.student.name.capitalizeFirst.toString(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
