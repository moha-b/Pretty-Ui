import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';

class QuantitySelector extends StatefulWidget {
  final int initialQuantity;
  final Color? borderCol;
  final void Function(int quantity) onChanged;

  const QuantitySelector({
    super.key,
    required this.initialQuantity,
    required this.onChanged,
    this.borderCol,
  });

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        widget.onChanged(_quantity);
      });
    }
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
      widget.onChanged(_quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.kLightPink2,
          border: Border.all(color: widget.borderCol ?? Colors.transparent)),
      child: Row(
        children: [
          GestureDetector(
            onTap: _decrementQuantity,
            child: Icon(Icons.remove, size: 15.h),
          ),
          SizedBox(width: 15.w),
          Text(
            _quantity.toString().padLeft(2, '0'),
            style: AppTypography.kExtraLight15,
          ),
          SizedBox(width: 15.w),
          GestureDetector(
            onTap: _incrementQuantity,
            child: Icon(Icons.add, size: 15.h),
          ),
        ],
      ),
    );
  }
}
