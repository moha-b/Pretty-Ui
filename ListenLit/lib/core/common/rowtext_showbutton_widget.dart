import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class RowTextShowButton extends StatelessWidget {
  String title, textButtonText;
  VoidCallback onPressed;
  RowTextShowButton({
    Key? key,
    required this.textButtonText,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.kWhiteColor,
            fontFamily: 'Inter',
          ),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Row(
            children: [
              Text(
                textButtonText,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.kPrimary,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(
                width: 4.25.w,
              ),
              GestureDetector(
                onTap: onPressed,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.kPrimary,
                  ),
                  width: 18.w,
                  height: 18.5.h,
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.kBlackColor,
                      size: 14.5.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
