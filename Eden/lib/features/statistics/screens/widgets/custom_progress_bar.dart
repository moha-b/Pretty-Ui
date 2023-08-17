import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProgressBar extends StatefulWidget {
  final double progress;
  final String text;

  const CustomProgressBar({
    required this.progress,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  _CustomProgressBarState createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _progressAnimation = Tween(begin: 0.0, end: widget.progress).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return AnimatedBuilder(
      animation: _progressAnimation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 70.h,
              width: 70.w,
              child: CircularProgressIndicator(
                value: _progressAnimation.value,
                strokeWidth: 3.w,
                backgroundColor: AppColors.kWhite.withOpacity(0.1),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.kAccent4,
                ),
              ),
            ),
            Text(
              widget.text,
              style: AppTypography.kBold20.copyWith(
                color: isDarkMode(context)
                    ? AppColors.kWhite
                    : AppColors.kSecondary,
              ),
            ),
          ],
        );
      },
    );
  }
}
