import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/app_colors.dart';
import 'package:listenlit/core/utils/icons_path.dart';
import 'package:listenlit/features/library/data/book_model.dart';
import 'package:listenlit/features/profile/data/usermodel.dart';
import 'package:oktoast/oktoast.dart';

import '../../../audio_player/screens/audio_player_screen.dart';

class PremiumPlaybackContainer extends StatelessWidget {
  const PremiumPlaybackContainer({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.only(top: 295.h, left: 16.w, right: 16.w),
      decoration: BoxDecoration(
          color: AppColor.kDarkBlue, borderRadius: BorderRadius.circular(8.r)),
      child: Row(children: [
        Expanded(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SvgPicture.asset(AppIcons.kUilBook),
            Container(
              padding: EdgeInsets.only(right: 24.w),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: AppColor.kLightWhite, width: 0.6),
                ),
              ),
              child: Text(
                'Read Nexus',
                style: TextStyle(
                  color: AppColor.kWhiteColor,
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ]),
        ),
        Expanded(
          child: GestureDetector(
            onTap: currentUser.isPremium
                ? () {
                    Get.to(() => AudioPlayerScreen(
                        bookModel: bookModel, currentChapterIndex: 0));
                  }
                : () {
                    showToast(
                      'Subscribe to Premium',
                      position: ToastPosition.bottom,
                      backgroundColor: AppColor.kPrimary,
                      radius: 8.0,
                      textPadding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(fontSize: 14.0.sp),
                    );
                  },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    AppIcons.kUilHeadphones,
                    color: currentUser.isPremium
                        ? AppColor.kWhiteColor
                        : AppColor.kGreyColor,
                  ),
                  Text(
                    'Play Nexus',
                    style: TextStyle(
                      color: currentUser.isPremium
                          ? AppColor.kWhiteColor
                          : AppColor.kGreyColor,
                      fontSize: 14.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ]),
          ),
        )
      ]),
    );
  }
}
