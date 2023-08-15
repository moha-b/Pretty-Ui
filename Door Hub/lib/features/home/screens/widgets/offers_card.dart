import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/buttons/custom_button.dart';
import '../../../../core/utils/utils.dart';

class OffersCard extends StatelessWidget {
  const OffersCard(
      {super.key,
      required this.offerOn,
      required this.amount,
      required this.color});
  final String offerOn;
  final String amount;
  final Color color;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 19.h),
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(offerOn, style: AppTypography.kMedium13),
                SizedBox(width: 10.w),
                SvgPicture.asset(AppAssets.kInfo)
              ],
            ),
            SizedBox(height: 5.h),
            Text(amount, style: AppTypography.kBold48),
            const Spacer(),
            CustomButton(
                text: 'Grab Offer', icon: AppAssets.kArrowForward, onTap: () {})
          ],
        ));
  }
}
