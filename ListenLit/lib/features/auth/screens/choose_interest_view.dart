import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/app_colors.dart';
import 'package:listenlit/features/auth/screens/widgets/interest_card.dart';
import 'package:oktoast/oktoast.dart';

import '../../../core/common/primarybutton.dart';
import '../../../core/helper/selectgenreslist.dart';
import '../../landing/landing_screen.dart';
import 'widgets/widgets.dart';

List<String> selectGenres = [];

class ChooseInterestScreen extends StatefulWidget {
  const ChooseInterestScreen({super.key});

  @override
  State<ChooseInterestScreen> createState() => _ChooseInterestScreenState();
}

class _ChooseInterestScreenState extends State<ChooseInterestScreen> {
  bool showMore = false;
  int displayedItemCount = 17; // Change this value as per your requirements
  void showAll() {
    displayedItemCount = showMore ? Genres.values.length : 17;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBGColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          const TopLevelTextWidget(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              width: 358.w,
              padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 24.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColor.kSamiDarkColor.withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.kSamiDarkColor.withOpacity(0.2),
                    blurRadius: 10, // Adjust the blur radius
                  ),
                ],
              ),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    const TextRow(),
                    SizedBox(
                      height: 24.h,
                    ),
                    Wrap(
                      children: List.generate(displayedItemCount, (index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 6.w, bottom: 8.h),
                          child: InterestCard(
                            onTap: () {
                              final genres = Genres.values[index].toString();
                              if (selectGenres.contains(genres)) {
                                selectGenres.remove(genres);
                              } else {
                                selectGenres.add(genres);
                              }
                              setState(() {
                                debugPrint(selectGenres.toString());
                              });
                            },
                            isSelected: selectGenres
                                .contains(Genres.values[index].toString()),
                            text: get(Genres.values[index]),
                          ),
                        );
                      }),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            showMore = !showMore;
                            showAll();
                            if (kDebugMode) {
                              print(showMore);
                            }
                          });
                        },
                        child: Text(
                          showMore ? 'Hide more' : 'Show more',
                          style: TextStyle(
                            color: AppColor.kPrimary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter',
                          ),
                        )),
                    PrimaryButton(
                      onTap: () {
                        if (selectGenres.length < 3) {
                          showToast(
                            'Select 3 or more genres to continue',
                            position: ToastPosition.top,
                            backgroundColor: AppColor.kPrimary,
                            radius: 8.0,
                            textStyle: TextStyle(fontSize: 14.0.sp),
                          );
                        } else {
                          Get.off(() => const LandingScreen());
                        }
                      },
                      borderRadius: 8.r,
                      fontSize: 14.sp,
                      height: 48.h,
                      width: 326.w,
                      text: 'Continue',
                      textColor: AppColor.kWhiteColor,
                      bgColor: AppColor.kPrimary,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const InstructionText()
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
