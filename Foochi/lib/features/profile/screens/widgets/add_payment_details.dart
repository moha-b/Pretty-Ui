import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';

import '../../../../core/common/buttons/primary_button.dart';
import '../../../auth/screens/widgets/auth_field.dart';

class AddPaymentDetails extends StatefulWidget {
  final void Function({
    required String cardHolderName,
    required String cardNumber,
    required String expireDate,
    required String cvc,
  }) addCardCallback;
  const AddPaymentDetails({super.key, required this.addCardCallback});

  @override
  State<AddPaymentDetails> createState() => _AddPaymentDetailsState();
}

class _AddPaymentDetailsState extends State<AddPaymentDetails> {
  final _cardHolderNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expireDateController = TextEditingController();
  final _cvcController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add New Card', style: AppTypography.kBold18),
            SizedBox(height: 10.h),
            Text('CARD HOLDER NAME', style: AppTypography.kLight11),
            AuthField(
              controller: _cardHolderNameController,
              hintText: 'Card Holder Name',
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Card holder name';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            Text('CARD NUMBER', style: AppTypography.kLight11),
            AuthField(
              controller: _cardNumberController,
              hintText: 'Card Number',
              keyboardType: TextInputType.number,
              inputFormatters: [CardNumberInputFormatter()],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Card Number';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Expire Date', style: AppTypography.kLight11),
                      AuthField(
                        controller: _expireDateController,
                        hintText: 'Date',
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Expire Date';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 17.h),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CVC', style: AppTypography.kLight11),
                    AuthField(
                      controller: _cvcController,
                      hintText: 'CVC',
                      isPasswordField: true,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter CVC Number';
                        }
                        return null;
                      },
                    ),
                  ],
                ))
              ],
            ),
            SizedBox(height: 54.h),
            PrimaryButton(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  widget.addCardCallback(
                    cardHolderName: _cardHolderNameController.text,
                    cardNumber: _cardNumberController.text,
                    cvc: _cvcController.text,
                    expireDate: _expireDateController.text,
                  );
                }
              },
              text: 'Add Card',
            )
          ],
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String value = newValue.text.replaceAll(RegExp(r'\s'), '');
    String formattedValue = '';

    for (int i = 0; i < value.length; i++) {
      formattedValue += value[i];
      if ((i + 1) % 4 == 0 && i != value.length - 1) {
        formattedValue += ' ';
      }
    }

    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(
        offset: formattedValue.length,
      ),
    );
  }
}
