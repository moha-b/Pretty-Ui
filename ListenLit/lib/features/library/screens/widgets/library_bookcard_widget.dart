import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:listenlit/core/utils/utils.dart';
import 'package:listenlit/features/library/data/book_model.dart';
import 'package:listenlit/features/profile/data/usermodel.dart';

class LibraryBookCardWidget extends StatelessWidget {
  final BookModel book;

  const LibraryBookCardWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).copyWith(right: 0, top: 0),
      child: Container(
        width: 180.w,
        padding: EdgeInsets.zero,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              book.bookImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.h,
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: 120.w,
              child: Text(
                book.bookName,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.kLightAccentColor,
                  fontFamily: 'Inter',
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 5.h),
            SizedBox(
              width: 127.w,
              child: Text(
                book.authorName,
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
                  book.description,
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
            currentUser.readingProgress[book.bookId] != null
                ? Padding(
                    padding: EdgeInsets.only(top: 16.h, right: 60.w),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                      decoration: BoxDecoration(
                          color: AppColor.kPrimary,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Center(
                        child: Text(
                          "${currentUser.readingProgress[book.bookId]!.progressPercentage.toString()}% completed",
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColor.kLightAccentColor,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  )
                : Padding(
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
                                  '${book.readTime}m',
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
                                  '${book.listenTime}m',
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
      ),
    );
  }
}
