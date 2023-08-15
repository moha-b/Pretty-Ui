import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_typography.dart';
import '../../data/address_model.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;
  final bool isCheckOutPage;
  final bool selectedAddress;
  final VoidCallback? onTap;
  const AddressCard(
      {Key? key,
      required this.address,
      this.isCheckOutPage = false,
      this.onTap,
      this.selectedAddress = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isCheckOutPage ? onTap : null,
      child: Row(
        children: [
          Container(
            height: 55.h,
            width: 55.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: address.color,
            ),
            child: SvgPicture.asset(address.image),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(address.title, style: AppTypography.kMedium16),
                SizedBox(height: 5.h),
                Text(
                  address.description,
                  style: AppTypography.kLight13
                      .copyWith(color: AppColors.kNeutral),
                ),
              ],
            ),
          ),
          isCheckOutPage
              ? Container(
                  height: 20.h,
                  width: 20.w,
                  padding: EdgeInsets.all(2.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.kPrimary, width: 2.w),
                    shape: BoxShape.circle,
                  ),
                  child: selectedAddress
                      ? Container(
                          decoration: const BoxDecoration(
                              color: AppColors.kPrimary,
                              shape: BoxShape.circle),
                        )
                      : null,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
