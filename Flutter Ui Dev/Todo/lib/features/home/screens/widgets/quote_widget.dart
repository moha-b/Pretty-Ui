import 'package:flutter/material.dart';

Widget quoteWidget(BuildContext context) {
  return const Positioned(
    top: 230.0,
    left: 50.0,
    child: Text(
      "Looks like feel good. \nYou have 3 tasks to do today",
      style: TextStyle(
        color: Colors.white70,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
