import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:foochi/features/profile/screens/profile_account_view.dart';
import 'package:foochi/features/profile/screens/profile_notification_view.dart';
import 'package:foochi/features/profile/screens/profile_payment_view.dart';
import 'package:foochi/features/profile/screens/widgets/change_image_card.dart';

import '../../../core/common/divider/custom_divider.dart';
import '../../../core/services/image_picker.dart';
import '../../menu/screens/widgets/custom_indicator_shape.dart';
import '../data/user_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 20.h),
            decoration: BoxDecoration(
                color: const Color(0xFFFFE2CD),
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30.r))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                const CustomDivider(),
                SizedBox(height: 20.h),
                ChangeImageCard(
                  onTap: () async {
                    pickedImage =
                        await ImagePickerServices().getImageFromGallery();
                    setState(() {});
                  },
                  pickedImage: pickedImage,
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Text('Welcome To',
                      style: AppTypography.kExtraLight18
                          .copyWith(color: AppColors.kSecondary)),
                ),
                Center(
                  child: Text(currentUser.name,
                      style: AppTypography.kBold30
                          .copyWith(color: AppColors.kOrange)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TabBar(
                    physics: const NeverScrollableScrollPhysics(),
                    indicator:
                        BoxTabIndicator(width: 25.w, color: AppColors.kPrimary),
                    isScrollable: true,
                    labelPadding: EdgeInsets.only(left: 0, right: 29.w),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: AppTypography.kMedium16,
                    labelColor: AppColors.kSecondary,
                    unselectedLabelColor: AppColors.kLightBrown,
                    tabs: const [
                      Tab(text: 'Account'),
                      Tab(text: 'Payment'),
                      Tab(text: 'Notifications'),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                const Expanded(
                  child: TabBarView(
                    children: [
                      ProfileAccountView(),
                      ProfilePaymentView(),
                      ProfileNotificationView(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
