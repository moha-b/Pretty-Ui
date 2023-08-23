import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/app_colors.dart';
import 'package:listenlit/core/utils/icons_path.dart';

class ExpandTextScreen extends StatelessWidget {
  String longText;
  ExpandTextScreen({super.key, required this.longText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back<void>();
          },
          icon: SvgPicture.asset(AppIcons.kIsoArrowDown),
        ),
        actions: [
          Row(
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: AppColor.kPrimary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.play_arrow_outlined,
                  color: AppColor.kBGColor,
                  size: 23.sp,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppIcons.kmusicIcon,
                    color: AppColor.kLightAccentColor,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    size: 23.sp,
                    Icons.more_vert,
                    color: AppColor.kLightAccentColor,
                  )),
            ],
          )
        ],
      ),
      body: ListView(
          padding: EdgeInsets.only(top: 24.h, left: 15.w, right: 17.w),
          children: [
            Text(
              'What is in it for me? Learn how to become an effective unofficial project manager',
              style: TextStyle(
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w700,
                  color: AppColor.kWhiteColor,
                  fontSize: 24.sp),
            ),
            SizedBox(
              height: 17.h,
            ),
            Text(
              longText,
              style: TextStyle(
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w500,
                  color: AppColor.kLightAccentColor,
                  fontSize: 16.sp),
              textAlign: TextAlign.justify,
            )
          ]),
    );
  }
}
