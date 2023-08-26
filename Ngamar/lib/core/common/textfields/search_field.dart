import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ngamar/core/utils/utils.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback filterCallback;
  final bool isEnabled;
  final bool isFilterIcon;
  final String? hintText;
  final void Function(String)? onChanged;
  const SearchField({
    required this.controller,
    required this.filterCallback,
    this.isEnabled = true,
    this.isFilterIcon = true,
    this.onChanged,
    this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.bottom,
      enabled: isEnabled,
      decoration: InputDecoration(
        hintText: hintText ?? 'Search...',
        border: InputBorder.none,
        prefixIcon: Padding(
          padding: EdgeInsets.all(14.h),
          child: SvgPicture.asset(
            AppAssets.kSearch,
          ),
        ),
        suffixIcon: isFilterIcon
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 20.0.h,
                    width: 1.w,
                    color: AppColors.kGrey30,
                  ),
                  IconButton(
                    onPressed: filterCallback,
                    icon: SvgPicture.asset(
                      AppAssets.kFilter,
                    ),
                  ),
                ],
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.kLine,
          ),
          borderRadius: BorderRadius.circular(
            AppSpacing.radiusThirty,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.kLine,
          ),
          borderRadius: BorderRadius.circular(
            AppSpacing.radiusThirty,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.kLine,
          ),
          borderRadius: BorderRadius.circular(AppSpacing.radiusThirty),
        ),
      ),
    );
  }
}
