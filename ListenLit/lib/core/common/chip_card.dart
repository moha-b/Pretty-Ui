// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:listenlit/features/home/data/chip_model.dart';

import '../utils/app_colors.dart';

class ChipCard extends StatelessWidget {
  ChipModel chipModel;
  VoidCallback onPressed;
  Color backgroundColor;
  ChipCard({
    Key? key,
    required this.chipModel,
    required this.onPressed,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w, top: 32.h),
      child: ActionChip(
          elevation: 0,
          side: BorderSide(color: AppColor.kGrey3Color),
          backgroundColor: backgroundColor,
          onPressed: onPressed,
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          label: Row(
            children: [
              SvgPicture.asset(chipModel.icons),
              SizedBox(
                width: 6.25.w,
              ),
              Text(
                chipModel.text,
                style: TextStyle(
                  color: AppColor.kLightAccentColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          )),
    );
  }
}
