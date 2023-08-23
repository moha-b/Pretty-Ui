// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listenlit/core/const.dart';
import 'package:listenlit/core/utils/utils.dart';
import 'package:listenlit/features/landing/widgets/bottomsheetplayertile.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentIndex = 0;
  bool isplaying = false;

  @override
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBlackColor,
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(bottom: 80.h),
        child: pages[_currentIndex],
      ),
      bottomSheet: BottomSheetPlayerTile(
        bottomPadding: 0,
        isPlaying: isplaying,
        onTab: () {
          setState(() {
            isplaying = !isplaying;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColor.kPrimary,
        unselectedItemColor: AppColor.kLightAccentColor,
        backgroundColor: AppColor.kBlackColor,
        elevation: 0,
        iconSize: 24.sp,
        selectedLabelStyle: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
        ),
        unselectedLabelStyle: TextStyle(
            color: AppColor.kLightAccentColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400),
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset(
                AppIcons.kHomeWhiteIcon,
              ),
            ),
            label: 'Home',
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset(
                AppIcons.khomeIcon,
                color: AppColor.kPrimary,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset(AppIcons.kExploreIcon),
            ),
            label: 'Explore',
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset(
                AppIcons.kExploreIcon,
                color: AppColor.kPrimary,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset(AppIcons.kLibraryIcon),
            ),
            label: 'Library',
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset(
                AppIcons.kLibraryIcon,
                color: AppColor.kPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
