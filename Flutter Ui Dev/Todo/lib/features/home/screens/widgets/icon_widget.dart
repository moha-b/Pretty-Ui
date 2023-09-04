import 'package:flutter/material.dart';

@override
Widget iconWidget(BuildContext context) {
  return Positioned(
    top: 100.0,
    left: 50.0,
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6.0,
            offset: const Offset(0.0, 5.0),
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: const CircleAvatar(
        //girl image
        backgroundImage: NetworkImage("https://i.imgur.com/BoN9kdC.png"),
        radius: 26.0,
      ),
    ),
  );
}
