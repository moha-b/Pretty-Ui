import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listenlit/core/utils/app_colors.dart';
import 'package:listenlit/core/utils/images_paths.dart';
import 'package:listenlit/features/profile/data/usermodel.dart';

class UserProfileContainer extends StatelessWidget {
  const UserProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColor.kDarkBlue, borderRadius: BorderRadius.circular(12.r)),
      child: ListTile(
        contentPadding: EdgeInsets.only(bottom: 12.h),
        leading: SizedBox(
          width: 60,
          height: 60,
          child: CircleAvatar(
            backgroundImage: AssetImage(AppImagePath.kProfile),
          ),
        ),
        title: Text(
          currentUser.userName,
          style: TextStyle(
            fontFamily: 'Gotham',
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            color: AppColor.kWhiteColor,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 4.h,
              ),
              child: Text(
                'A FanklinConvey Title',
                style: TextStyle(
                  color: AppColor.kLightAccentColor,
                  fontSize: 12.sp,
                  fontFamily: 'Gotham',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                'Managers who want to create positive work environments',
                style: TextStyle(
                  color: AppColor.kLightAccentColor,
                  fontSize: 14.sp,
                  fontFamily: 'Gotham',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
