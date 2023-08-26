import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/profile/screens/widgets/help_support_tile.dart';

class HelpSupportView extends StatefulWidget {
  const HelpSupportView({super.key});

  @override
  State<HelpSupportView> createState() => _HelpSupportViewState();
}

class _HelpSupportViewState extends State<HelpSupportView> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Help and Support',
          style: AppTypography.kSemiBold16.copyWith(color: AppColors.kGrey100),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        physics: const BouncingScrollPhysics(),
        children: [
          SearchField(
            controller: _searchController,
            filterCallback: () {},
            isFilterIcon: false,
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          const HelpSupportTile(
            title: 'Lorem ipsum dolor sit amet',
            description:
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
          ),
          const Divider(color: AppColors.kLine, height: 0),
          const HelpSupportTile(
            title: 'Lorem ipsum dolor sit amet',
            description:
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
          ),
          const Divider(color: AppColors.kLine, height: 0),
          const HelpSupportTile(
            title: 'Lorem ipsum dolor sit amet',
            description:
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
          ),
          const Divider(color: AppColors.kLine, height: 0),
          const HelpSupportTile(
            title: 'Lorem ipsum dolor sit amet',
            description:
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
          ),
          const Divider(color: AppColors.kLine, height: 0),
          const HelpSupportTile(
            title: 'Lorem ipsum dolor sit amet',
            description:
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
          ),
        ],
      ),
    );
  }
}
