import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../animations/heart_animation.dart';

class CustomRatingField extends StatefulWidget {
  final int maxRating;
  final double initialRating;
  final Function(double) onChanged;

  const CustomRatingField({
    Key? key,
    this.maxRating = 5,
    this.initialRating = 0,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomRatingFieldState createState() => _CustomRatingFieldState();
}

class _CustomRatingFieldState extends State<CustomRatingField> {
  double _currentRating = 0;
  int _pressedIndex = -1;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  void _handleTap(int index) {
    if (_isAnimating) return;

    double newRating = index + 1.toDouble();
    setState(() {
      _currentRating = newRating;
    });
    widget.onChanged(newRating);

    setState(() {
      _pressedIndex = index;
      _isAnimating = true;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _pressedIndex = -1;
        _isAnimating = false;
      });
    });
  }

  void _handleHorizontalDragUpdate(DragUpdateDetails details) {
    if (_isAnimating) return;

    RenderBox box = context.findRenderObject() as RenderBox;
    final starSize = 40.h;
    final starCount = widget.maxRating;
    final position = box.globalToLocal(details.globalPosition);
    final dx = position.dx;

    final rating = (dx / starSize).clamp(0, starCount.toDouble());

    double newRating = rating.floor().toDouble();
    if (newRating != _currentRating) {
      setState(() {
        _currentRating = newRating;
      });
      widget.onChanged(newRating);
    }
  }

  Widget _buildStar(int index) {
    Color starIconColor =
        index < _currentRating ? AppColors.kPrimary : AppColors.kHint;

    return GestureDetector(
      onTap: () => _handleTap(index),
      onHorizontalDragUpdate: _handleHorizontalDragUpdate,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: HeartAnimationWidget(
          isAnimating: _pressedIndex == index && _isAnimating,
          duration: const Duration(milliseconds: 400),
          onEnd: () {
            setState(() {
              _isAnimating = false;
            });
          },
          child: Icon(
            Icons.star_rounded,
            size: 40.h,
            color: starIconColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.maxRating,
        (index) => _buildStar(index),
      ),
    );
  }
}
