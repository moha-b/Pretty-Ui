import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngamar/core/core.dart';

import '../../../search/screens/widgets/filter_sheet.dart';


class SelectPaymentMethod extends StatefulWidget {
  const SelectPaymentMethod({super.key});

  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.kGrey20,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusThirty),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomDivider(),
          SizedBox(height: AppSpacing.thirtyVertical),
          Text(
            'Payment Method',
            style: AppTypography.kSemiBold16,
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          SelectPaymentMethodCard(
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            },
            cardDetails: 'sask****@mail.com',
            cardName: 'Paypal',
            icon: AppAssets.kPaypal,
            isSelected: selectedIndex == 0,
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          SelectPaymentMethodCard(
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            },
            cardDetails: '4827 8472 7424 ****',
            cardName: 'Master Card',
            icon: AppAssets.kMasterCardIcon,
            isSelected: selectedIndex == 1,
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(16.h),
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(4.h),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.kLine,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add_circle_outline_outlined),
                  ),
                  SizedBox(width: AppSpacing.tenHorizontal),
                  Text(
                    'Add Payment Method',
                    style: AppTypography.kMedium14,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          PrimaryButton(
            onTap: () {},
            text: 'Confirm Payment',
          ),
        ],
      ),
    );
  }
}

class SelectPaymentMethodCard extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final String cardName;
  final String icon;
  final String cardDetails;
  const SelectPaymentMethodCard({
    required this.onTap,
    required this.isSelected,
    required this.cardName,
    required this.icon,
    required this.cardDetails,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.kLine,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(width: AppSpacing.tenHorizontal),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardName,
                  style: AppTypography.kMedium14,
                ),
                SizedBox(height: AppSpacing.fiveVertical),
                Text(
                  cardDetails,
                  style: AppTypography.kMedium14
                      .copyWith(color: AppColors.kGrey70, fontSize: 12.sp),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 20.h,
              width: 20.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: isSelected ? AppColors.kPrimary : AppColors.kWhite,
                border: Border.all(
                  color: isSelected ? AppColors.kPrimary : AppColors.kLine,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      size: 12,
                      color: AppColors.kWhite,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
