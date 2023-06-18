import 'package:flutter/material.dart';

import '../../../core/models/hotel_model.dart';
import '../../../core/resources/dimns.dart';
import 'green_icon.dart';

class Facilities extends StatelessWidget {
  const Facilities({
    super.key,
    required this.size,
  });
  final Size size;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppDimns.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Facilities",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppDimns.medium),
            Row(
                children: List.generate(
                    4,
                    (index) => Expanded(
                          child: GreenIcon(
                            size: size,
                            text: facilities[index].text,
                            icon: facilities[index].icon,
                          ),
                        ))),
            const SizedBox(height: AppDimns.medium),
            Row(
                children: List.generate(
                    4,
                    (index) => Expanded(
                          child: GreenIcon(
                            size: size,
                            text: facilities[index + 4].text,
                            icon: facilities[index + 4].icon,
                          ),
                        ))),
          ],
        ),
      ),
    );
  }
}
