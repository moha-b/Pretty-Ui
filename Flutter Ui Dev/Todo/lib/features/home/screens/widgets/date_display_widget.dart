import 'package:flutter/material.dart';

Widget dateDisplay(BuildContext context) {
  return const Positioned(
    top: 320.0,
    left: 50.0,
    child: Text(
      "TODAY : SEPTEMBER 12, 2023",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
