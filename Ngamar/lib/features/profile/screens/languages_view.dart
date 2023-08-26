import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/profile/screens/widgets/language_tile.dart';

class LanguagesView extends StatefulWidget {
  const LanguagesView({super.key});

  @override
  State<LanguagesView> createState() => _LanguagesViewState();
}

class _LanguagesViewState extends State<LanguagesView> {
  int selectedLanguageIndex = 0;

  void selectLanguage(int index) {
    setState(() {
      if (selectedLanguageIndex == index) {
        selectedLanguageIndex = -1;
      } else {
        selectedLanguageIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Languages',
          style: AppTypography.kSemiBold16.copyWith(color: AppColors.kGrey100),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.kLine),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Suggested Languages',
                  style: AppTypography.kSemiBold12.copyWith(
                    color: AppColors.kGrey60,
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return LanguageTile(
                      onTap: () => selectLanguage(index),
                      isSelected: selectedLanguageIndex == index,
                      text: suggestedLanguages[index],
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    color: AppColors.kLine,
                    height: 1,
                  ),
                  itemCount: suggestedLanguages.length,
                ),
              ],
            ),
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 10.0.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.radiusTen),
              border: Border.all(color: AppColors.kLine),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Other Languages',
                  style: AppTypography.kSemiBold12.copyWith(
                    color: AppColors.kGrey60,
                    fontSize: 12.sp,
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return LanguageTile(
                      onTap: () =>
                          selectLanguage(index + suggestedLanguages.length),
                      isSelected: selectedLanguageIndex ==
                          (index + suggestedLanguages.length),
                      text: otherLanguages[index],
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    color: AppColors.kLine,
                    height: 1,
                  ),
                  itemCount: otherLanguages.length,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
