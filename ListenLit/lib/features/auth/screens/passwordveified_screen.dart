// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/app_colors.dart';
import 'package:listenlit/core/utils/images_paths.dart';

import '../../../core/common/background_imagecontainer.dart';
import '../../../core/common/passwordtextfield.dart';
import '../../../core/common/primarybutton.dart';
import '../../landing/landing_screen.dart';

class PasswordVeifiedScreen extends StatelessWidget {
  PasswordVeifiedScreen({super.key});
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BackgroundImageContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 235.5.h, right: 144.w, bottom: 15.h, left: 10.w),
              child: Text(
                'Set Password',
                style: TextStyle(
                  fontSize: 32.sp,
                  color: AppColor.kLightAccentColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                width: 358.w,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColor.kSamiDarkColor.withOpacity(0.4),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.kSamiDarkColor.withOpacity(0.5),
                      blurRadius: 10, // Adjust the blur radius
                    ),
                  ],
                ),
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(AppImagePath.kSuccessIcon),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            'Code verified',
                            style: TextStyle(
                                color: AppColor.kSamiAccentColor,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      PasswordTextField(
                        hintText: 'Enter new password',
                        controller: passwordController,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r)),
                        width: 326.w,
                        height: 48.h,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      PasswordTextField(
                        hintText: 'Re-type new password',
                        controller: confirmPasswordController,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r)),
                        width: 326.w,
                        height: 48.h,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'At-least 8 characters',
                            style: TextStyle(
                                color: AppColor.kSamiAccentColor,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      PrimaryButton(
                        onTap: () {
                          Get.off(() => const LandingScreen());
                        },
                        borderRadius: 8.r,
                        fontSize: 14.sp,
                        height: 48.h,
                        width: 326.w,
                        text: 'Set Password',
                        textColor: AppColor.kWhiteColor,
                        bgColor: AppColor.kPrimary,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
