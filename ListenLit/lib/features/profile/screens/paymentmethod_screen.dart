import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/utils.dart';
import 'package:listenlit/features/profile/controller/payment_controller.dart';
import 'package:listenlit/features/profile/data/payment_model.dart';
import 'package:listenlit/features/profile/screens/widgets/bottomsheetbutton.dart';
import 'package:listenlit/features/profile/screens/widgets/defaultpaymentlist_widget.dart';
import 'package:listenlit/features/profile/screens/widgets/paymentheader_widget.dart';

import '../../../core/helper/helper_function.dart';

// List<PaymentModel> get globelPaymentList => paymentList;

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int selectCard = 0;
  PaymentController pc = Get.put(PaymentController());

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
                'Account',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  color: AppColor.kLightAccentColor,
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
          const PaymentHeaderWidget(),
          Obx(
            () {
              return pc.paymentList.isEmpty
                  ? DefaultPaymentListWidget(
                      paymentList: paymentList,
                      selectCard: selectCard,
                      onSelectCard: (value) {
                        setState(() {
                          selectCard = value;
                        });
                      },
                      onRemoveCard: (val) {
                        paymentList.removeAt(val);
                        setState(() {});
                      })
                  : Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 32.h),
                        // itemCount: paymentList.length,
                        itemCount: pc.paymentList.length,
                        itemBuilder: (context, index) {
                          PaymentModel paymentModel = pc.paymentList[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 358.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: index == pc.selectCard
                                    ? AppColor.kPrimary
                                    : AppColor.kGrey3Color,
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 12.w,
                                              right: 16.w,
                                              top: 12.h,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  convertNonDigitsToAsterisks(
                                                          digits: paymentModel
                                                              .cardNumber)
                                                      .split(' ')[3],
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          AppColor.kWhiteColor,
                                                      fontFamily: 'Gotham'),
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Text(
                                                  paymentModel.cardNumber
                                                      .split(' ')[3],
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color:
                                                          AppColor.kWhiteColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Gotham'),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            paymentModel.cardDate,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.kWhiteColor,
                                                fontFamily: 'Gotham'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            pc.setSelectCard(index);
                                            pc.update();
                                          },
                                          icon: Icon(
                                            index == selectCard
                                                ? Icons.check_circle_outline
                                                : Icons.circle_outlined,
                                            color: AppColor.kLightAccentColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              pc.removePaymentCard(
                                                  currentIndex: index);
                                              pc.update();
                                            },
                                            icon: SvgPicture.asset(
                                              AppIcons.kTrash,
                                              color: AppColor.kLightAccentColor,
                                            )),
                                      ],
                                    )
                                  ]),
                            ),
                          );
                        },
                      ),
                    );
            },
          ),
        ]),
      ),
      bottomSheet: const BottomSheetButton(),
    );
  }
}
