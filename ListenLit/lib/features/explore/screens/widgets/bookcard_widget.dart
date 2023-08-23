// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:listenlit/core/utils/app_colors.dart';
import 'package:listenlit/core/utils/icons_path.dart';
import 'package:listenlit/features/library/data/book_model.dart';

class BookCardWidget extends StatelessWidget {
  const BookCardWidget({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      padding: EdgeInsets.zero,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            bookModel.bookImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250.h,
          ),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            width: 120.w,
            child: Text(
              bookModel.bookName,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.kLightAccentColor,
                fontFamily: 'Inter',
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            width: 127.w,
            child: Text(
              bookModel.authorName,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.kLightAccentColor,
                fontFamily: 'Inter',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: SizedBox(
              width: 170.w,
              child: Text(
                bookModel.description,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.kLightAccentColor,
                  fontFamily: 'Inter',
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.kPrimary,
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.kmusicIcon,
                          width: 12.w,
                          height: 12.h,
                          color: AppColor.kLightAccentColor,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          '${bookModel.listenTime}m',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColor.kLightAccentColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.kSamiAccentColor,
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.kGlasses,
                          color: AppColor.kBGColor,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          '${bookModel.readTime}m',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColor.kBGColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
