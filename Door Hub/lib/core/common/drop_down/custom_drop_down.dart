import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_typography.dart';

class CustomDropDown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final ValueChanged<String?>? onChanged;

  const CustomDropDown({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: 70.w,
      child: Center(
        child: DropdownButton<String>(
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: const SizedBox(),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,
                  style: AppTypography.kMedium14.copyWith(
                      color: isDarkMode(context)
                          ? AppColors.kWhite
                          : Colors.black)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
