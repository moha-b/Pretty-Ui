import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foochi/core/utils/utils.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final void Function(String)? onChange;
  const SearchField(
      {Key? key, required this.controller, this.focusNode, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChange,
      style: AppTypography.kLight14,
      decoration: InputDecoration(
          constraints: BoxConstraints(maxHeight: 47.h),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          hintText: 'Search',
          suffixIcon: Padding(
            padding: EdgeInsets.all(13.h),
            child: SvgPicture.asset(
              AppAssets.kSearch,
            ),
          )),
    );
  }
}
