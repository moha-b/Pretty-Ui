import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStackImages extends StatelessWidget {
  final List<String> images;
  const CustomStackImages({required this.images, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: Stack(
        children: [
          ...List.generate(
            images.length > 4 ? 4 : images.length,
            (index) => Positioned(
              left: (index * (25.w + 20.w)).toDouble(),
              child: Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          if (images.length > 4)
            Positioned(
              left: (4 * (25.w + 20.w)).toDouble(),
              child: Container(
                height: 50.h,
                width: 50.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.kPrimary,
                ),
                child: Text(
                  '+${images.length - 4}',
                  style:
                      AppTypography.kBold20.copyWith(color: AppColors.kWhite),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
