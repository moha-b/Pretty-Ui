import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/common/common.dart';
import 'package:listenlit/core/utils/utils.dart';
import 'package:listenlit/features/profile/controller/payment_controller.dart';
import 'package:listenlit/features/profile/data/payment_model.dart';

import '../../../core/helper/helper_function.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({super.key});

  @override
  State<AddPaymentMethodScreen> createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  TextEditingController cardController = TextEditingController();

  TextEditingController cardNameController = TextEditingController();

  TextEditingController cardCVVController = TextEditingController();

  TextEditingController cardDateController = TextEditingController();

  bool _isButtonEnabled = false;
  @override
  void initState() {
    super.initState();

    cardController.addListener(_onTextChanged);
    cardDateController.addListener(_onTextChanged);

    cardNameController.addListener(_onTextChanged);
    cardCVVController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    cardDateController.removeListener(_onTextChanged);
    cardController.removeListener(_onTextChanged);
    cardNameController.removeListener(_onTextChanged);
    cardCVVController.removeListener(_onTextChanged);
    cardDateController.dispose();
    cardController.dispose();
    cardNameController.dispose();
    cardCVVController.dispose();
    super.dispose();
  }

  final paymentController = Get.find<PaymentController>();
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
                'Payment',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  color: AppColor.kLightAccentColor,
                  fontWeight: FontWeight.w500,
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
          Text(
            'Add payment method',
            style: TextStyle(
              fontSize: 24.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              color: AppColor.kPrimary,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'Unlimited insights from books, courses documentaries, and podcasts.',
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Gotham',
              fontWeight: FontWeight.w400,
              color: AppColor.kLightAccentColor,
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          PrimaryTextFormField(
            hintTextColor: AppColor.kGrey2Color,
            hintText: 'Card number',
            controller: cardController,
            width: 358.w,
            height: 48.h,
            keyboardType: TextInputType.number,
            fillColor: AppColor.kGrey3Color,
            enabledBorder: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(),
            errorBorder: const OutlineInputBorder(),
            focusedErrorBorder: const OutlineInputBorder(),
            borderRadius: 8.r,
            onChanged: (p0) {},
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              FourDigitFormatter(),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          PrimaryTextFormField(
            hintText: 'Cardholder name',
            controller: cardNameController,
            width: 358.w,
            height: 48.h,
            hintTextColor: AppColor.kGrey2Color,
            borderRadius: 8.r,
            fillColor: AppColor.kGrey3Color,
            enabledBorder: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(),
            errorBorder: const OutlineInputBorder(),
            keyboardType: TextInputType.text,
            focusedErrorBorder: const OutlineInputBorder(),
            onChanged: (p0) {},
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              PrimaryTextFormField(
                hintText: 'CVV',
                controller: cardCVVController,
                width: 171.w,
                height: 48.h,
                keyboardType: TextInputType.number,
                hintTextColor: AppColor.kGrey2Color,
                borderRadius: 8.r,
                fillColor: AppColor.kGrey3Color,
                enabledBorder: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                errorBorder: const OutlineInputBorder(),
                focusedErrorBorder: const OutlineInputBorder(),
                onChanged: (p0) {},
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
              ),
              SizedBox(
                width: 16.w,
              ),
              PrimaryTextFormField(
                hintText: 'MM/YY',
                controller: cardDateController,
                width: 171.w,
                height: 48.h,
                hintTextColor: AppColor.kGrey2Color,
                borderRadius: 8.r,
                fillColor: AppColor.kGrey3Color,
                keyboardType: TextInputType.datetime,
                enabledBorder: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                errorBorder: const OutlineInputBorder(),
                focusedErrorBorder: const OutlineInputBorder(),
                onChanged: (text) {
                  if (text.length >= 6) {
                    final month = text.substring(0, 2);
                    final year = text.substring(2);

                    final formattedDate = '$month/$year';

                    cardDateController.text = formattedDate;
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
              )
            ],
          ),
          const Spacer(),
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(bottom: 23.h),
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
              ),
              child: PrimaryButton(
                onTap: _isButtonEnabled
                    ? () {
                        PaymentModel paymentModel = PaymentModel(
                          id: '1',
                          cardNumber: cardController.text.trim(),
                          cardHolderName: cardNameController.text.trim(),
                          cardCVVNumber: cardCVVController.text.trim(),
                          cardDate: cardDateController.text.trim(),
                          cardImage: AppIcons.kMasterCard,
                        );
                        paymentController.addPaymentCard(paymentModel);

                        Get.back();
                      }
                    : () {},
                borderRadius: 8,
                text: 'Add New Payment Method',
                iconData: Icons.add_circle_outline_rounded,
                textColor: AppColor.kWhiteColor,
                bgColor: _isButtonEnabled
                    ? AppColor.kPrimary
                    : AppColor.kPrimary.withOpacity(0.3),
              ),
            ),
          )
        ]),
      ),
    );
  }

  void _onTextChanged() {
    setState(() {
      _isButtonEnabled = cardDateController.text.isNotEmpty &&
          cardController.text.isNotEmpty &&
          cardNameController.text.isNotEmpty &&
          cardCVVController.text.isNotEmpty;
    });
  }
}
