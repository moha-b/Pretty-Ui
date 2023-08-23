import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/utils.dart';
import 'package:listenlit/features/profile/screens/premiumplan_details_screen.dart';
import 'package:listenlit/features/profile/screens/select_card_screen.dart';
import 'package:listenlit/features/profile/screens/widgets/widgets.dart';

import '../../../core/common/primarybutton.dart';

class PremiumPlansScreen extends StatelessWidget {
  const PremiumPlansScreen({super.key});

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
      body: Padding(
        padding: EdgeInsets.only(
          top: 32.h,
          left: 16.w,
          right: 16.w,
        ),
        child: Column(
          children: [
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
                    'Limited time offer today ',
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
                  FeaturesComparisonWidget(),
                  SizedBox(
                    height: 32.h,
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
                    height: 4.h,
                  ),
                  Center(
                    child: Text(
                      'only \$79.99/year',
                      style: TextStyle(
                        color: AppColor.kLightAccentColor,
                        fontSize: 14.sp,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 23.5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => PremiumPlansDetailScreen());
                    },
                    child: Center(
                      child: Text(
                        'VIEW ALL PLANS',
                        style: TextStyle(
                          color: AppColor.kLightAccentColor,
                          fontSize: 16.sp,
                          fontFamily: 'Gotham',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const MembershipTermsWidget(
              title:
                  'Your membership starts as soon as you set up payment and subscribe. Your monthly charge will occur on the last day of the current billing period. We’ll renew your membership for you can manage your subscription or turn off auto-renewal under accounts setting.',
              subTitle:
                  'By continuing, you are agreeing to these terms. See the privacy statement and restrictions.',
            )
          ],
        ),
      ),
    );
  }
}
