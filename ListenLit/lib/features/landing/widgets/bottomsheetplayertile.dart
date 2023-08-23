import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/utils.dart';

class BottomSheetPlayerTile extends StatelessWidget {
  const BottomSheetPlayerTile(
      {super.key,
      required this.isPlaying,
      required this.onTab,
      this.bottomPadding = 14});
  final bool isPlaying;
  final VoidCallback onTab;
  final double? bottomPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: bottomPadding!.sp),
      height: 100.h,
      width: Get.width,
      color: Colors.transparent,
      child: Container(
        width: Get.width,
        color: AppColor.kGrey3Color,
        child: ListTile(
          leading: Padding(
            padding: EdgeInsets.only(
              top: 7.h,
            ),
            child: SizedBox(
              height: 54.h,
              width: 38.w,
              child: Image.asset(
                AppImagePath.kFuturism,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(
              top: 7.h,
            ),
            child: Text(
              'Continue Listening',
              style: TextStyle(
                fontFamily: 'Gotham',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.kPrimary,
              ),
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 7.h),
            child: Text(
              'Managers who want to create positive work environments...',
              style: TextStyle(
                fontFamily: 'Gotham',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.kLightAccentColor,
              ),
            ),
          ),
          trailing: SizedBox(
            width: 100.w,
            height: 50.h,
            child: Padding(
              padding: EdgeInsets.only(
                top: 19.h,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: onTab,
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.kPrimary),
                      child: Center(
                        child: isPlaying
                            ? Icon(
                                Icons.pause,
                                size: 19.sp,
                              )
                            : Icon(
                                Icons.play_arrow,
                                size: 19.sp,
                              ),
                      ),
                    ),
                  ),
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColor.kPrimary),
                    child: Center(
                      child: SvgPicture.asset(
                        AppIcons.kUilForward,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
