import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:listenlit/features/library/data/book_model.dart';

import '../utils/app_colors.dart';
import '../utils/icons_path.dart';

class PostCardWidget extends StatelessWidget {
  BookModel trendingModel;
  PostCardWidget({
    Key? key,
    required this.trendingModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5.w, bottom: 3.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 184.h,
            width: 128.w,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                trendingModel.bookImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            width: 120.w,
            child: Text(
              trendingModel.bookName,
              style: TextStyle(
                fontSize: 13.sp,
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
          Text(
            trendingModel.authorName,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
              color: AppColor.kLightAccentColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.kmusicIcon,
                      width: 12.w,
                      height: 12.h,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      '${trendingModel.listenTime}m',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: AppColor.kLightAccentColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 16.w,
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.kGlasses),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      '${trendingModel.readTime}m',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: AppColor.kLightAccentColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
