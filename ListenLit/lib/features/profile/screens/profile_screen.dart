import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/utils.dart';
import 'package:listenlit/features/profile/controller/payment_controller.dart';
import 'package:listenlit/features/profile/data/usermodel.dart';
import 'package:listenlit/features/profile/screens/paymentmethod_screen.dart';
import 'package:listenlit/features/profile/screens/premiumplans_screen.dart';
import 'package:listenlit/features/profile/screens/profiledetails_screen.dart';
import 'package:listenlit/features/profile/screens/subscription_screen.dart';
import 'package:oktoast/oktoast.dart';

import '../../auth/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBlackColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.kBlackColor,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 20.sp,
              ),
              Text(
                'Home',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 8.h,
          left: 16.w,
          right: 16.w,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ' Account',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  color: AppColor.kLightAccentColor,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              SvgPicture.asset(
                AppIcons.kLinearLine,
                width: 112.w,
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SizedBox(
              width: 60.w,
              height: 70.h,
              child: CircleAvatar(
                backgroundImage: AssetImage(AppImagePath.kProfile),
              ),
            ),
            title: Text(
              'John Doe',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                color: AppColor.kLightAccentColor,
              ),
            ),
            subtitle: Text(
              'john.doe@example.com',
              style: TextStyle(
                color: AppColor.kLightAccentColor,
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: GestureDetector(
              onTap: () {
                Get.to(() => const PremiumPlansScreen());
              },
              child: Container(
                width: 66.w,
                height: 28.h,
                decoration: BoxDecoration(
                  color: AppColor.kPrimary,
                  borderRadius: BorderRadius.circular(
                    20.r,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  child: Text(
                    'Premium',
                    style: TextStyle(
                      color: AppColor.kLightAccentColor,
                      fontSize: 10.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(
            color: AppColor.kSamiDarkColor,
          ),
          ProfileListItem(
              iconData: AppIcons.kProfileIcon,
              title: 'Profile details',
              trailingIcon: Icons.arrow_forward_ios,
              onPressed: () {
                UserModel userModel = UserModel(
                    id: '1',
                    userName: 'John Doe',
                    userImage: AppImagePath.kProfile,
                    email: 'john.doe@example.com',
                    dateOfBirth: '23 December, 1972');
                Get.to(() => ProfileDetailsScreen(
                      userModel: userModel,
                    ));
              }),
          SizedBox(
            height: 24.h,
          ),
          ProfileListItem(
              iconData: AppIcons.kPaymentCard,
              title: 'Payment',
              trailingIcon: Icons.arrow_forward_ios,
              onPressed: () {
                Get.put(PaymentController());
                Get.to(() => const PaymentMethodScreen());
              }),
          SizedBox(
            height: 24.h,
          ),
          ProfileListItem(
            iconData: AppIcons.kStar,
            title: 'Subscription',
            trailingIcon: Icons.arrow_forward_ios,
            onPressed: () {
              Get.to(() => const SubscriptionScreen());
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          Divider(
            color: AppColor.kSamiDarkColor,
          ),
          ProfileListItem(
              iconData: AppIcons.kHelpIcon,
              title: 'FAQs',
              trailingIcon: Icons.arrow_forward_ios,
              onPressed: () {}),
          SizedBox(
            height: 24.h,
          ),
          ProfileListItem(
            iconData: AppIcons.kSignout,
            title: 'Logout',
            onPressed: () async {
              await showToast(
                'Logout..       ',
                position: ToastPosition.bottom,
                backgroundColor: AppColor.kPrimary,
                radius: 8.0,
                constraints: BoxConstraints(
                  maxWidth: 150.w,
                ),
                textStyle: TextStyle(
                  fontSize: 14.0.sp,
                ),
              );
              Get.offAll(
                () => LoginScreen(),
                transition: Transition.upToDown,
              );
            },
          ),
        ]),
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  String iconData, title;
  IconData? trailingIcon;
  final VoidCallback onPressed;
  ProfileListItem(
      {Key? key,
      required this.onPressed,
      required this.iconData,
      required this.title,
      this.trailingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColor.kBGColor, borderRadius: BorderRadius.circular(8.r)),
        child: Center(child: SvgPicture.asset(iconData)),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: AppColor.kLightAccentColor,
        ),
      ),
      trailing: trailingIcon == null
          ? null
          : Icon(
              trailingIcon,
              color: AppColor.kWhiteColor,
              size: 14.sp,
            ),
    );
  }
}
