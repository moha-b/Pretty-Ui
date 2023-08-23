// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/app_colors.dart';
import 'package:listenlit/core/utils/images_paths.dart';

import '../../../core/common/background_imagecontainer.dart';
import '../../../core/common/passwordtextfield.dart';
import '../../../core/common/primarybutton.dart';
import '../../../core/common/primarytextbutton.dart';
import '../../landing/landing_screen.dart';
import 'forgetpassword_screen.dart';

class LoginPasswordScreen extends StatelessWidget {
  LoginPasswordScreen({super.key});
  TextEditingController passController = TextEditingController();
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
                top: 235.h, right: 263.w, bottom: 15.h, left: 32.w),
            child: Text(
              'Login',
              style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  color: AppColor.kLightAccentColor),
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
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: SizedBox(
                        width: 60.w,
                        height: 70.h,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(AppImagePath.kProfile),
                        ),
                      ),
                      title: Text(
                        'John Doe',
                        style: TextStyle(
                          color: AppColor.kLightAccentColor,
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        'john.doe@example.com',
                        style: TextStyle(
                          color: AppColor.kLightAccentColor,
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Icon(
                        Icons.check_circle_outline,
                        color: AppColor.kPrimary,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    PasswordTextField(
                      hintText: 'Password',
                      controller: passController,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      width: 326.w,
                      height: 48.h,
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
                      text: 'Continue',
                      textColor: AppColor.kWhiteColor,
                      bgColor: AppColor.kPrimary,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    PrimaryTextButton(
                      title: 'Forgot password?',
                      fontSize: 14.sp,
                      onPressed: () {
                        Get.to(() => ForgetPasswordScreen());
                      },
                      textColor: AppColor.kPrimary,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
