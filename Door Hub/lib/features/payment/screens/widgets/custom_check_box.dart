import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const CustomCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  CustomCheckBoxState createState() => CustomCheckBoxState();
}

class CustomCheckBoxState extends State<CustomCheckBox> {
  bool _value = false;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(CustomCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _value) {
      setState(() {
        _value = widget.value;
      });
    }
  }

  void _toggleValue() {
    final newValue = !_value;
    setState(() {
      _value = newValue;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(newValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleValue,
      child: Container(
        width: 24.w,
        height: 24.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: _value ? null : Border.all(color: AppColors.kHint),
          color: _value ? AppColors.kPrimary : null,
        ),
        child: _value
            ? const Icon(
                Icons.check,
                size: 24 * 0.6,
                color: AppColors.kHint,
              )
            : null,
      ),
    );
  }
}
