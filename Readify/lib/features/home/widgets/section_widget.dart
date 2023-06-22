import 'package:flutter/material.dart';
import 'package:readify/core/resources/dimn.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key,
    required this.title,
    required this.child,
    this.spaceAroundTitle,
    this.margin,
    required this.isViewAll,
  });
  final String title;
  final Widget child;
  final EdgeInsets? margin;
  final double? spaceAroundTitle;
  final bool isViewAll;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: spaceAroundTitle ?? 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w600),
                ),
                isViewAll
                    ? const Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 18,
                          shadows: [
                            Shadow(color: Colors.pink, offset: Offset(0, -5))
                          ],
                          color: Colors.transparent,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.pink,
                          decorationThickness: 1.5,
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
          const SizedBox(
            height: AppDimns.medium,
          ),
          Expanded(child: child),
          const SizedBox(
            height: AppDimns.small,
          ),
        ],
      ),
    );
  }
}
