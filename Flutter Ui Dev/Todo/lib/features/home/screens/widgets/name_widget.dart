import 'package:flutter/material.dart';

Widget nameWidget(BuildContext context) {
  return const Positioned(
    top: 180.0,
    left: 50.0,
    child: Text(
      'Hello, Jane',
      style: TextStyle(
        color: Colors.white,
        fontSize: 32.0,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
