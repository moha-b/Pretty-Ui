import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/utils.dart';

import '../onboarding/screens/onboarding_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.off(() => const OnBoardingScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 274.h, left: 149.w, right: 135.49.w),
          child: SvgPicture.asset(
            AppImagePath.kLogoListenLit,
            color: AppColor.kPrimary,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.82.h, right: 89.w, left: 96.w),
          child: Text(
            'ListenLit',
            style: TextStyle(
              fontSize: 50.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
              color: AppColor.kPrimary,
            ),
          ),
        )
      ]),
    );
  }
}
