import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_typography.dart';

class QuantityCard extends StatefulWidget {
  final String text;
  final void Function(int) onChanged;

  const QuantityCard({Key? key, required this.text, required this.onChanged})
      : super(key: key);

  @override
  QuantityCardState createState() => QuantityCardState();
}

class QuantityCardState extends State<QuantityCard> {
  int quantity = 0;

  void increment() {
    setState(() {
      quantity++;
      widget.onChanged(quantity);
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 0) {
        quantity--;
        widget.onChanged(quantity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.text, style: AppTypography.kLight16),
        const Spacer(),
        QuantityActionButton(onTap: decrement, icon: Icons.remove),
        SizedBox(width: 17.w),
        Text(quantity.toString(), style: AppTypography.kExtraLight18),
        SizedBox(width: 17.w),
        QuantityActionButton(
          onTap: increment,
          icon: Icons.add,
          isActive: quantity > 0,
        ),
      ],
    );
  }
}

class QuantityActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final bool isActive;

  const QuantityActionButton(
      {Key? key,
      required this.onTap,
      required this.icon,
      this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36.h,
        width: 36.w,
        decoration: BoxDecoration(
          color: isActive ? AppColors.kPrimary : null,
          border: isActive ? null : Border.all(color: AppColors.kHint),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(icon,
            size: 20.h, color: isActive ? AppColors.kWhite : AppColors.kHint),
      ),
    );
  }
}
