import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/utils.dart';
import 'package:listenlit/features/profile/screens/select_card_screen.dart';
import 'package:listenlit/features/profile/screens/widgets/widgets.dart';

import '../../../core/common/primarybutton.dart';

class PremiumPlansDetailScreen extends StatefulWidget {
  PremiumPlansDetailScreen({super.key});

  @override
  State<PremiumPlansDetailScreen> createState() =>
      _PremiumPlansDetailScreenState();
}

class _PremiumPlansDetailScreenState extends State<PremiumPlansDetailScreen> {
  bool selectCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBGColor,
      appBar: AppBar(
        backgroundColor: AppColor.kBGColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColor.kWhiteColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: 32.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Column(children: [
            const PremiumPlanOverviewWidget(
                subTitle:
                    'Unlimited insights from books, courses documentaries, and podcasts.',
                title: 'Try Book Nexus Premium'),
            SizedBox(
              height: 32.h,
            ),
            SizedBox(
              width: 334.w,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'All Premium Plans',
                      style: TextStyle(
                        color: AppColor.kWhiteColor,
                        fontSize: 16.sp,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectCard = !selectCard;
                                    });
                                  },
                                  child: Container(
                                    width: 171.w,
                                    decoration: BoxDecoration(
                                      color: AppColor.kBackGroundColor,
                                      border: Border.all(
                                          color: selectCard
                                              ? AppColor.kPrimary
                                              : AppColor.kBackGroundColor,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(
                                        8.r,
                                      ),
                                    ),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 24.h,
                                                left: 21.w,
                                                right: 21.w),
                                            child: Text(
                                              'Monthly',
                                              style: TextStyle(
                                                color:
                                                    AppColor.kLightAccentColor,
                                                fontSize: 14.sp,
                                                fontFamily: 'Gotham',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 8.h,
                                            ),
                                            child: Text(
                                              'USD 60.00',
                                              style: TextStyle(
                                                color: AppColor.kWhiteColor,
                                                fontSize: 18.sp,
                                                fontFamily: 'Gotham',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 20.h,
                                              left: 21.w,
                                              right: 3.w,
                                              bottom: 24.h,
                                            ),
                                            child: Text(
                                              'Billed & recurring monthly Cancel anytime',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color:
                                                    AppColor.kLightAccentColor,
                                                fontSize: 14.sp,
                                                fontFamily: 'Gotham',
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectCard = !selectCard;
                                    });
                                  },
                                  child: Container(
                                    width: 171.w,
                                    decoration: BoxDecoration(
                                      color: AppColor.kBackGroundColor,
                                      border: Border.all(
                                          color: selectCard
                                              ? AppColor.kBackGroundColor
                                              : AppColor.kPrimary,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(
                                        8.r,
                                      ),
                                    ),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 24.h,
                                                left: 21.w,
                                                right: 21.w),
                                            child: Text(
                                              'Monthly',
                                              style: TextStyle(
                                                color:
                                                    AppColor.kLightAccentColor,
                                                fontSize: 14.sp,
                                                fontFamily: 'Gotham',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 8.h,
                                            ),
                                            child: Text(
                                              'USD 90.00',
                                              style: TextStyle(
                                                color:
                                                    AppColor.kLightAccentColor,
                                                fontSize: 18.sp,
                                                fontFamily: 'Gotham',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 20.h,
                                              left: 21.w,
                                              right: 3.w,
                                              bottom: 26.h,
                                            ),
                                            child: Text(
                                              'Billed & recurring monthly Cancel anytime',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color:
                                                    AppColor.kLightAccentColor,
                                                fontSize: 14.sp,
                                                fontFamily: 'Gotham',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 4.h,
                          left: selectCard ? 56.w : 219.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                                color: AppColor.kPrimary,
                                borderRadius: BorderRadius.circular(4.r)),
                            height: 24.h,
                            child: Center(
                              child: Text(
                                'Save 75%',
                                style: TextStyle(
                                  color: AppColor.kLightAccentColor,
                                  fontSize: 10.sp,
                                  fontFamily: 'Gotham',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 143.h,
                            left: selectCard ? 70.w : 234.w,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: AppColor.kPrimary,
                                shape: BoxShape.circle,
                              ),
                              height: 30.h,
                              width: 30.w,
                              child: Center(
                                  child: Icon(
                                Icons.check,
                                size: 20.sp,
                              )),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    PrimaryButton(
                      borderRadius: 4.r,
                      onTap: () {
                        Get.to(() => const SelectCardScreen());
                      },
                      fontSize: 14.sp,
                      text: 'Start 3-day free trail now',
                      textColor: AppColor.kLightAccentColor,
                      bgColor: AppColor.kPrimary,
                    ),
                    SizedBox(
                      height: 15.5.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Center(
                        child: Text(
                          'NO THANKS',
                          style: TextStyle(
                            color: AppColor.kLightAccentColor,
                            fontSize: 14.sp,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: 12.h,
            ),
            const MembershipTermsWidget(
              title:
                  'Your membership starts as soon as you set up payment and subscribe. Your monthly charge will occur on the last day of the current billing period. We’ll renew your membership for you can manage your subscription or turn off auto-renewal under accounts setting.',
              subTitle:
                  'By continuing, you are agreeing to these terms. See the privacy statement and restrictions.',
            )
          ]),
        ),
      ),
    );
  }
}
