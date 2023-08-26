import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/profile/screens/widgets/custom_debit_card.dart';

class YourCard extends StatefulWidget {
  const YourCard({super.key});

  @override
  State<YourCard> createState() => _YourCardState();
}

class _YourCardState extends State<YourCard> {
  int selectedCardIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Your Card',
          style: AppTypography.kSemiBold16.copyWith(color: AppColors.kGrey100),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          children: [
            CustomDebitCard(
              cardColor: AppColors.kBlue,
              cardIcon: AppAssets.kVisaDebit,
              cardNumber: '9865 3567 4563 4235',
              currentBalance: '3,242,23',
              expireDate: '12/24',
            ),
            CustomCardSelectionTile(
              onTap: () {
                setState(() {
                  selectedCardIndex = 0;
                });
              },
              isSelected: selectedCardIndex == 0,
            ),
            CustomDebitCard(
              cardColor: AppColors.kGrey100,
              cardIcon: AppAssets.kMasterCard,
              cardNumber: '9865 3567 4563 4235',
              currentBalance: '3,242,23',
              expireDate: '12/24',
            ),
            CustomCardSelectionTile(
              onTap: () {
                setState(() {
                  selectedCardIndex = 1;
                });
              },
              isSelected: selectedCardIndex == 1,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCardSelectionTile extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  const CustomCardSelectionTile({
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 26.h,
        width: 26.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.kPrimary : AppColors.kWhite,
          border: Border.all(
            color: isSelected ? AppColors.kPrimary : AppColors.kGrey30,
          ),
        ),
        child: isSelected
            ? const Icon(Icons.check, color: AppColors.kWhite, size: 15)
            : null,
      ),
      minLeadingWidth: 10.w,
      title: Text(
        'Use as default payment method',
        style: AppTypography.kSemiBold14.copyWith(color: AppColors.kGrey70),
      ),
    );
  }
}
