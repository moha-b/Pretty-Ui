import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';

class DetailInfoChips extends StatelessWidget {
  final String text;
  final bool isRatingChip;
  const DetailInfoChips(
      {super.key, required this.text, this.isRatingChip = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7.h),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.kLine2),
            borderRadius: BorderRadius.circular(8.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isRatingChip
                ? Image.asset(
                    AppAssets.kStarFilled,
                    height: 15,
                  )
                : const SizedBox(),
            Text(text, style: AppTypography.kLight13),
          ],
        ),
      ),
    );
  }
}
