import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/utils.dart';

class ToggleButton extends StatefulWidget {
  final VoidCallback onLightModeSelected;
  final VoidCallback onDarkModeSelected;

  const ToggleButton({
    super.key,
    required this.onLightModeSelected,
    required this.onDarkModeSelected,
  });

  @override
  ToggleButtonState createState() => ToggleButtonState();
}

const double width = 300;
const double height = 50;
const double lightAlign = -1;
const double darkAlign = 1;
const Color selectedColor = Colors.black;
const Color normalColor = Colors.white;

class ToggleButtonState extends State<ToggleButton> {
  late double xAlign;
  late Color lightColor;
  late Color darkColor;

  @override
  void initState() {
    super.initState();
    xAlign = lightAlign;
    lightColor = selectedColor;
    darkColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 50.h,
      padding: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
        color: AppColors.kWhite.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusFifty),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(xAlign, 0),
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: width * 0.45,
              height: height,
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(AppSpacing.radiusFifty),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = lightAlign;
                lightColor = selectedColor;
                darkColor = normalColor;
              });
              widget.onLightModeSelected();
            },
            child: Align(
              alignment: const Alignment(-1, 0),
              child: Container(
                width: width * 0.45,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.kLight,
                      colorFilter:
                          ColorFilter.mode(lightColor, BlendMode.srcIn),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Light',
                      style:
                          AppTypography.kMedium15.copyWith(color: lightColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = darkAlign;
                darkColor = selectedColor;
                lightColor = normalColor;
              });
              widget.onDarkModeSelected();
            },
            child: Align(
              alignment: const Alignment(1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.kDark,
                      colorFilter: ColorFilter.mode(darkColor, BlendMode.srcIn),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Dark',
                      style: AppTypography.kMedium15.copyWith(color: darkColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
