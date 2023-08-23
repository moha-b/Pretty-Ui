import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/helper/helper_function.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/icons_path.dart';
import '../expantext_screen.dart';

class BookCardWithShareButton extends StatelessWidget {
  const BookCardWithShareButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 358.w,
      decoration: BoxDecoration(
          color: AppColor.kDarkBlue, borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: AppColor.kWhiteColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  padding: EdgeInsets.only(bottom: 12.h),
                  onPressed: () {
                    Get.to(() => ExpandTextScreen(
                          longText: descriptionText,
                        ));
                  },
                  icon: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle, color: AppColor.kPrimary),
                      child: Center(child: SvgPicture.asset(AppIcons.kExpand))),
                ),
              )
            ],
          ),
          Text(
            shortDescriptionText,
            style: TextStyle(
              color: AppColor.kLightAccentColor,
              fontSize: 16.sp,
              fontFamily: 'Gotham',
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          GestureDetector(
            onTap: () {},
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.only(
                    top: 5.h, bottom: 5.h, left: 7.w, right: 7.w),
                decoration: BoxDecoration(
                    color: AppColor.kPrimary,
                    borderRadius: BorderRadius.circular(4.r)),
                width: 85.w,
                height: 28.h,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.share,
                        size: 20.sp,
                        color: AppColor.kWhiteColor,
                      ),
                      Text(
                        'Share',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          color: AppColor.kWhiteColor,
                        ),
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
