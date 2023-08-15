import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/events.dart';

class CustomMarkerBuilder extends StatelessWidget {
  final List<Event> events;

  const CustomMarkerBuilder({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) return const SizedBox();

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: events.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 25.h),
          padding: const EdgeInsets.all(1),
          child: Container(
            width: 5.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ),
          ),
        );
      },
    );
  }
}
