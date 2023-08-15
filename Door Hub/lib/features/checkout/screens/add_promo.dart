import 'package:door_hub/core/common/common_widgets.dart';
import 'package:door_hub/features/checkout/screens/widget/promo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/screens/widgets/search_field.dart';

class AddPromoCode extends StatefulWidget {
  const AddPromoCode({super.key});

  @override
  State<AddPromoCode> createState() => _AddPromoCodeState();
}

class _AddPromoCodeState extends State<AddPromoCode> {
  final _promoCodeController = TextEditingController();
  int _selectedPromoCode = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            PrimaryContainer(
                child: Column(
              children: [
                CustomHeaderText(text: 'Promo Code', fontSize: 18.sp),
                SizedBox(height: 16.h),
                SearchField(
                    controller: _promoCodeController,
                    hintText: 'Apply Code',
                    buttonText: 'Apply',
                    isSearchField: false,
                    onSearchPress: () {})
              ],
            )),
            SizedBox(height: 20.h),
            PrimaryContainer(
              child: Column(
                children: [
                  CustomHeaderText(text: 'Promo Code', fontSize: 18.sp),
                  SizedBox(height: 16.h),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return PromoCard(
                          onTap: () {
                            setState(() {
                              _selectedPromoCode = index;
                            });
                          },
                          isSelected: _selectedPromoCode == index,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          Divider(height: 20.h),
                      itemCount: 2)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
