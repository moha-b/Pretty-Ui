import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBarWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          CupertinoIcons.line_horizontal_3_decrease,
          color: Colors.white,
          size: 28,
        ),
      ),
      title: const Text(
        "TODO",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            size: 28,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
