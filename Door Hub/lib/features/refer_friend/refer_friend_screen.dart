import 'package:door_hub/core/common/common_widgets.dart';
import 'package:door_hub/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferFriend extends StatelessWidget {
  const ReferFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: PrimaryContainer(
            child: Column(
          children: [
            Image.asset(AppAssets.kReferFriend),
            SizedBox(height: 20.h),
            Text(
              'Refer a Friend &\nGet 50% off',
              style: AppTypography.kBold32,
              textAlign: TextAlign.center,
            ),
            Text(
              "• Get 50% off upto \$20 after your friend’s 1st order \n• Your friend gets 50% off on their 1st order",
              style: AppTypography.kLight14,
            ),
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: PrimaryButton(onTap: () {}, text: 'Refer a Friend'),
            )
          ],
        )),
      ),
    );
  }
}
