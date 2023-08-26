import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';

class QuantityCard extends StatefulWidget {
  final Function(int quantity) onChanged;

  const QuantityCard({
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QuantityCardState createState() => _QuantityCardState();
}

class _QuantityCardState extends State<QuantityCard> {
  int quantity = 1;

  void increment() {
    setState(() {
      quantity++;
      widget.onChanged(quantity);
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 1) {
        quantity--;
        widget.onChanged(quantity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.h),
      decoration: BoxDecoration(
        color: Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: decrement,
            child: Container(
              padding: EdgeInsets.all(2.0..h),
              decoration: const BoxDecoration(
                color: AppColors.kWhite,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.remove,
                size: 20,
              ),
            ),
          ),
          SizedBox(width: 8.0.w),
          Text(
            quantity.toString(),
            style: AppTypography.kSemiBold14,
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: increment,
            child: Container(
              padding: EdgeInsets.all(2.0.h),
              decoration: const BoxDecoration(
                color: AppColors.kWhite,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
