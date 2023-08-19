import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foochi/core/utils/utils.dart';

import '../../data/credit_card.dart';

class CreditCard extends StatelessWidget {
  final CreditCardModel creditCard;
  const CreditCard({super.key, required this.creditCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186.h,
      transform: Transform.translate(
        offset: const Offset(0, 0),
      ).transform,
      padding: EdgeInsets.all(25.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          image: DecorationImage(
            image: AssetImage(AppAssets.kCardBg),
            fit: BoxFit.cover,
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AppAssets.kCreditLogo),
              Text(
                'Master Card',
                style: AppTypography.kBold16,
              )
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(creditCard.accountNumber, style: AppTypography.kLight13),
                  Text(creditCard.ownerName, style: AppTypography.kBold16),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('MONTH/ YEAR', style: AppTypography.kLight11),
                  Text(creditCard.expireDate, style: AppTypography.kBold16),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
