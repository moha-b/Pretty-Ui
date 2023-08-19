import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/app_typography.dart';

class PaymentMethodSelector extends StatefulWidget {
  const PaymentMethodSelector({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentMethodSelectorState createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  int _selectedPaymentMethod = 0;

  void _onPaymentMethodChanged(int? value) {
    setState(() {
      _selectedPaymentMethod = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20.w,
          child: Radio<int>(
            value: 0,
            groupValue: _selectedPaymentMethod,
            onChanged: _onPaymentMethodChanged,
          ),
        ),
        SizedBox(width: 5.w),
        Text('Credit Card', style: AppTypography.kExtraLight15),
        const Spacer(),
        SizedBox(
          width: 20.w,
          child: Radio<int>(
            value: 1,
            groupValue: _selectedPaymentMethod,
            onChanged: _onPaymentMethodChanged,
          ),
        ),
        SizedBox(width: 5.w),
        Text('Paypal', style: AppTypography.kExtraLight15),
        const Spacer(),
        SizedBox(
          width: 20.w,
          child: Radio<int>(
            value: 2,
            groupValue: _selectedPaymentMethod,
            onChanged: _onPaymentMethodChanged,
          ),
        ),
        SizedBox(width: 5.w),
        Text('Cash', style: AppTypography.kExtraLight15),
      ],
    );
  }
}
