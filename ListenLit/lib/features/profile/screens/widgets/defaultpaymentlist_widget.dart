import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listenlit/core/utils/utils.dart';
import 'package:listenlit/features/profile/data/payment_model.dart';

import '../../../../core/helper/helper_function.dart';

class DefaultPaymentListWidget extends StatelessWidget {
  final List<PaymentModel> paymentList;
  final int selectCard;
  final Function(int) onSelectCard;
  final Function(int) onRemoveCard;

  const DefaultPaymentListWidget({
    super.key,
    required this.paymentList,
    required this.selectCard,
    required this.onSelectCard,
    required this.onRemoveCard,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 32.h),
        itemCount: paymentList.length,
        itemBuilder: (context, index) {
          PaymentModel paymentModel = paymentList[index];
          return InkWell(
            onTap: () => onSelectCard(index),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 358,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: index == selectCard
                      ? AppColor.kPrimary
                      : AppColor.kGrey3Color,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 12.w,
                              right: 16.w,
                              top: 12,
                              bottom: 12.h,
                            ),
                            child: SvgPicture.asset(
                              paymentModel.cardImage,
                              color: index == selectCard
                                  ? AppColor.kWhiteColor
                                  : AppColor.kPrimary,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: 8.w,
                              top: 14.5.h,
                              bottom: 14.5.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  convertNonDigitsToAsterisks(
                                    digits: paymentModel.cardNumber,
                                  ).split(' ')[3],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.kWhiteColor,
                                    fontFamily: 'Gotham',
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  paymentModel.cardNumber.split(' ')[3],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.kWhiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Gotham',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            paymentModel.cardDate,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColor.kWhiteColor,
                              fontFamily: 'Gotham',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.r),
                      child: Row(
                        children: [
                          Icon(
                            index == selectCard
                                ? Icons.check_circle_outline
                                : Icons.circle_outlined,
                            color: AppColor.kLightAccentColor,
                          ),
                          // IconButton(
                          //   padding: EdgeInsets.zero,
                          //   constraints: BoxConstraints(),
                          //   onPressed: () {
                          //     onSelectCard(index);
                          //   },
                          //   icon: Icon(
                          //     index == selectCard
                          //         ? Icons.check_circle_outline
                          //         : Icons.circle_outlined,
                          //     color: AppColor.kLightAccentColor,
                          //   ),
                          // ),
                          SizedBox(
                            width: 8.w,
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {
                              onRemoveCard(index);
                            },
                            icon: SvgPicture.asset(
                              AppIcons.kTrash,
                              color: AppColor.kLightAccentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
