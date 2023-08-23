import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listenlit/core/utils/app_colors.dart';

class InputFieldWidget extends StatelessWidget {
  String label;
  TextEditingController controller;
  InputFieldWidget({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColor.kLightAccentColor,
            fontFamily: 'Inter',
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Container(
          width: 358.w,
          height: 48.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColor.kGrey3Color,
          ),
          child: TextFormField(
            controller: controller,
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.kLightAccentColor),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.5.h)
                      .copyWith(right: 0, bottom: 20.h),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColor.kWhiteColor,
                    size: 12.sp,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
