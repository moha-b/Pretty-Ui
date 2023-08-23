import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/app_colors.dart';
import 'package:listenlit/features/library/data/book_model.dart';

class TagListContainer extends StatelessWidget {
  final BookModel bookModel;

  const TagListContainer({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: 280.w,
      child: Wrap(
        children: List.generate(
            bookModel.tagsList.length,
            (index) => Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.h,
                    right: 8.w,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0.w,
                      vertical: 8.0.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.kGrey3Color,
                      borderRadius: BorderRadius.circular(8.0.r),
                      border: Border.all(
                        width: 0.2.w,
                        color: AppColor.kSamiDarkColor,
                      ),
                    ),
                    child: Text(
                      bookModel.tagsList[index].capitalize.toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                        color: AppColor.kLightAccentColor,
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
