import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:listenlit/features/audio_player/controller/audio_controller.dart';
import 'package:listenlit/features/audio_player/screens/widgets/blurredimage_container.dart';
import 'package:listenlit/features/audio_player/screens/widgets/bookcardwith_sharebutton.dart';
import 'package:listenlit/features/library/data/book_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../core/helper/helper_function.dart';
import '../../../core/utils/icons_path.dart';

class AudioPlayerScreen extends StatefulWidget {
  BookModel bookModel;
  int currentChapterIndex;
  AudioPlayerScreen(
      {super.key, required this.bookModel, required this.currentChapterIndex});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBlackColor,
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
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
              ))
        ],
      ),
      body: Stack(children: [
        BlurredImageContainer(
          backGroundImage: widget.bookModel.bookImage,
          forGroundImage: widget.bookModel.bookImage,
        ),
        Container(
          margin: EdgeInsets.only(top: 350.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: GetBuilder<AudioController>(
              init: AudioController(
                  book: widget.bookModel,
                  currentChapterIndex: widget.currentChapterIndex),
              builder: (ac) {
                if (ac.loading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    Text(
                      widget.bookModel.bookName,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: AppColor.kWhiteColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      widget.bookModel.description,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: AppColor.kWhiteColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        trackShape: CustomTrackShape(),
                      ),
                      child: Slider(
                        thumbColor: AppColor.kLightAccentColor,
                        inactiveColor: AppColor.kDarkBlue,
                        value: ac.position.inSeconds.toDouble() /
                            ac.duration.inSeconds.toDouble(),
                        onChanged: ac.onSliderValueChanged,
                        min: 0.0,
                        max: 1.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ac.position.format(),
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'Gotham',
                              color: AppColor.kLightWhite,
                            ),
                          ),
                          Text(ac.duration.format(),
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'Gotham',
                                color: AppColor.kLightWhite,
                              ))
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: ac.playBack,
                          child: SvgPicture.asset(
                            AppIcons.kSkipForward,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 71.w, right: 31.w),
                          child: GestureDetector(
                            onTap: () async {
                              await ac.player!.seek(Duration(
                                  seconds: ac.position.inSeconds - 10));
                              ac.update();
                            },
                            child: SvgPicture.asset(
                              AppIcons.kRewind10,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: ac.playPause,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppColor.kPrimary,
                              shape: BoxShape.circle,
                            ),
                            child: ac.isPlaying
                                ? Icon(
                                    Icons.pause,
                                    size: 50.sp,
                                  )
                                : Icon(
                                    Icons.play_arrow_outlined,
                                    size: 50.sp,
                                  ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 31.w, right: 59.w),
                          child: GestureDetector(
                            onTap: () async {
                              await ac.player!.seek(Duration(
                                  seconds: ac.position.inSeconds + 10));
                              ac.update();
                            },
                            child: SvgPicture.asset(
                              AppIcons.kSkipForward10,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: ac.playNext,
                          child: SvgPicture.asset(
                            AppIcons.kRightSkipForward,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    BookCardWithShareButton(title: widget.bookModel.bookName),
                  ],
                );
              },
            ),
          ),
        )
      ]),
    );
  }
}

extension FormatString on Duration {
  String format() => toString().substring(2, 7);
}
