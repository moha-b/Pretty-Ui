import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/app_colors.dart';
import 'package:listenlit/features/library/data/book_model.dart';
import 'package:listenlit/features/profile/data/usermodel.dart';
import 'package:oktoast/oktoast.dart';

import '../../../audio_player/screens/audio_player_screen.dart';
import '../../../library/data/chapter_model.dart';

class ChapterListContainer extends StatelessWidget {
  const ChapterListContainer({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380.h,
      width: 358.w,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '${bookModel.chaptersList.length} Chapters',
          style: TextStyle(
              fontSize: 20.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              color: AppColor.kWhiteColor),
        ),
        SizedBox(
          height: 24.h,
        ),
        Expanded(
          child: SizedBox(
            height: 380.h,
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                Wrap(
                  children:
                      List.generate(bookModel.chaptersList.length, (index) {
                    ChaptersModel chaptersModel = bookModel.chaptersList[index];
                    return ListTile(
                      onTap: () {
                        if (chaptersModel.isPremium == currentUser.isPremium) {
                          Get.to(
                              () => AudioPlayerScreen(
                                  bookModel: bookModel,
                                  currentChapterIndex: index),
                              transition: Transition.downToUp);
                        } else {
                          showToast(
                            'Subscribe to Premium',
                            position: ToastPosition.bottom,
                            backgroundColor: AppColor.kPrimary,
                            radius: 8.0,
                            textStyle: TextStyle(fontSize: 14.0.sp),
                          );
                        }
                      },
                      contentPadding: EdgeInsets.only(bottom: 12.h),
                      leading: Text(
                        (index + 1).toString().padLeft(2, '0'),
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Gotham',
                            color: AppColor.kWhiteColor),
                      ),
                      title: Text(
                        chaptersModel.title,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            color: AppColor.kWhiteColor),
                      ),
                      subtitle: Text(
                        chaptersModel.subtitle,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Gotham',
                            color: AppColor.kLightWhite),
                      ),
                      trailing: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.kDarkBlue,
                          ),
                          child:
                              chaptersModel.isPremium == currentUser.isPremium
                                  ? Icon(
                                      Icons.play_arrow,
                                      size: 18.sp,
                                    )
                                  : Icon(
                                      Icons.lock,
                                      size: 18.sp,
                                    )),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
