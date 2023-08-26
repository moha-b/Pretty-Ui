import 'package:flutter/material.dart';
import 'package:ngamar/core/core.dart';

class HelpSupportTile extends StatefulWidget {
  final String title;
  final String description;
  const HelpSupportTile({
    required this.description,
    required this.title,
    super.key,
  });

  @override
  State<HelpSupportTile> createState() => _HelpSupportTileState();
}

class _HelpSupportTileState extends State<HelpSupportTile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        iconColor: isExpanded ? AppColors.kPrimary : Colors.black,
        onExpansionChanged: (val) {
          setState(() {
            isExpanded = val;
          });
        },
        backgroundColor: AppColors.kWhite,
        title: Text(
          widget.title,
          style: AppTypography.kSemiBold16
              .copyWith(color: isExpanded ? AppColors.kPrimary : Colors.black),
        ),
        children: [
          Text(
            widget.description,
            style: AppTypography.kMedium14.copyWith(
              color: AppColors.kGrey60,
            ),
          ),
        ],
      ),
    );
  }
}
