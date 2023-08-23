import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/common/common.dart';
import 'package:listenlit/core/utils/app_colors.dart';
import 'package:listenlit/features/profile/data/payment_model.dart';
import 'package:listenlit/features/profile/screens/premiumplan_access_screen.dart';

import '../../../core/helper/helper_function.dart';
import 'widgets/widgets.dart';

class SelectCardScreen extends StatefulWidget {
  const SelectCardScreen({super.key});

  @override
  State<SelectCardScreen> createState() => _SelectCardScreenState();
}

class _SelectCardScreenState extends State<SelectCardScreen> {
  int selectCard = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(bottom: 23.h),
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
          ),
          child: PrimaryButton(
            onTap: () {
              Get.to(() => const PremiumplansAccessScreen());
            },
            borderRadius: 8,
            text: 'Confirm',
            textColor: AppColor.kLightAccentColor,
            bgColor: AppColor.kPrimary,
          ),
        ),
      ),
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
      body: Padding(
        padding: EdgeInsets.only(
          top: 32.h,
          left: 16.w,
          right: 16.w,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
            ),
            child: const PremiumPlanOverviewWidget(
                subTitle:
                    'Unlimited insights from books, courses documentaries, and podcasts.',
                title: 'Select Card'),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 32.h),
              // itemCount: paymentList.length,
              itemCount: 2,
              itemBuilder: (context, index) {
                PaymentModel paymentModel = paymentList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 358.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: index == selectCard
                          ? AppColor.kPrimary
                          : AppColor.kGrey3Color,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 12.w,
                                    right: 16.w,
                                    top: 12.h,
                                    bottom: 12.h,
                                  ),
                                  child: SvgPicture.asset(
                                    paymentModel.cardImage,
                                    color: index == selectCard
                                        ? AppColor.kWhiteColor
                                        : AppColor.kPrimary,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 8.w,
                                    top: 14.5.h,
                                    bottom: 14.5.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        convertNonDigitsToAsterisks(
                                                digits: paymentModel.cardNumber)
                                            .split(' ')[3],
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.kWhiteColor,
                                            fontFamily: 'Gotham'),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        paymentModel.cardNumber.split(' ')[3],
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: AppColor.kWhiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Gotham'),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  paymentModel.cardDate,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.kWhiteColor,
                                      fontFamily: 'Gotham'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectCard = index;
                                });
                              },
                              child: Icon(
                                index == selectCard
                                    ? Icons.check_circle_outline
                                    : Icons.circle_outlined,
                                color: AppColor.kLightAccentColor,
                              ),
                            ),
                          )
                        ]),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
