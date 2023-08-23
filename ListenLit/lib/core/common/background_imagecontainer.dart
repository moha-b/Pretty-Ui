import 'package:flutter/material.dart';

import '../utils/images_paths.dart';

class BackgroundImageContainer extends StatelessWidget {
  const BackgroundImageContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppImagePath.kRectangleBackgound,
              ),
              fit: BoxFit.cover)),
      child: child,
    );
  }
}
