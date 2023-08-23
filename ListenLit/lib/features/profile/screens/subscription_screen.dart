import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/app_colors.dart';

import 'widgets/widgets.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBlackColor,
      appBar: AppBar(
        backgroundColor: AppColor.kBlackColor,
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
          top: 24.h,
          left: 16.w,
          right: 16.w,
        ),
        child: Column(children: [
          const PremiumPlanOverviewWidget(
            subTitle:
                'Unlimited insights from books, courses documentaries, and podcasts.',
            title: 'Premium Plan Overview',
          ),
          SizedBox(
            height: 32.h,
          ),
          const SubscriptionInfoWidget(),
          const MembershipTermsWidget(
            title:
                'Your membership starts as soon as you set up payment and subscribe. Your monthly charge will occur on the last day of the current billing period. We’ll renew your membership for you can manage your subscription or turn off auto-renewal under accounts setting.',
            subTitle:
                'By continuing, you are agreeing to these terms. See the privac statement and restricions.',
          ),
        ]),
      ),
    );
  }
}
