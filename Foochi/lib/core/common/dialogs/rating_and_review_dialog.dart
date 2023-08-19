import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:get/get.dart';

import '../buttons/primary_button.dart';
import '../divider/custom_divider.dart';

class RatingAndReviewDialog extends StatefulWidget {
  const RatingAndReviewDialog({super.key});

  @override
  State<RatingAndReviewDialog> createState() => _RatingAndReviewDialogState();
}

class _RatingAndReviewDialogState extends State<RatingAndReviewDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      backgroundColor: AppColors.kLightPink2,
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomDivider(),
              SizedBox(height: 20.h),
              Center(
                  child: Text('About & Review', style: AppTypography.kBold24)),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text('Tap to Rate:', style: AppTypography.kMedium16),
                  SizedBox(width: 15.w),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 25.h,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) {},
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Text('Write a Review:', style: AppTypography.kMedium16),
              SizedBox(height: 10.h),
              RatingTextField(
                  controller: _titleController, maxLines: 1, hintText: 'Title'),
              SizedBox(height: 20.h),
              RatingTextField(
                  controller: _descriptionController,
                  maxLines: 5,
                  hintText: 'Review'),
              SizedBox(height: 30.h),
              Center(
                child: PrimaryButton(
                  onTap: () {
                    Get.back();
                  },
                  text: 'Send',
                  width: 110.w,
                  height: 50.h,
                  borderRadius: 10.r,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RatingTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final String hintText;
  const RatingTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
