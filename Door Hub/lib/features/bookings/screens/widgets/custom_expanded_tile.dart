import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/containers/primary_container.dart';
import '../../../../core/common/texts/custom_header_text.dart';

class CustomExpandedTile extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const CustomExpandedTile(
      {super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
        child: Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ListTileTheme(
        dense: true,
        child: ExpansionTile(
          childrenPadding: EdgeInsets.zero,
          tilePadding: EdgeInsets.zero,
          title: CustomHeaderText(text: title, fontSize: 18.sp),
          children: children,
        ),
      ),
    ));
  }
}
