import 'package:flutter/material.dart';
import 'package:helia/core/resources/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? color;
  final VoidCallback pressed;

  const CustomButton(
      {super.key,
      required this.text,
      this.textColor,
      this.color,
      required this.pressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: pressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(size.width * 0.85, size.height * 0.06),
        backgroundColor: color ?? AppColors.primary,
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor ?? Colors.white),
      ),
    );
  }
}
