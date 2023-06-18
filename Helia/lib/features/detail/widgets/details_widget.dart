import 'package:flutter/material.dart';
import 'package:helia/core/models/hotel_model.dart';
import 'package:helia/core/resources/dimns.dart';

import 'green_icon.dart';

class HotelProperties extends StatelessWidget {
  const HotelProperties({
    super.key,
    required this.size,
    required this.title,
    required this.list,
  });
  final String title;
  final Size size;
  final List<Details> list;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppDimns.medium),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: AppDimns.medium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    list.length,
                    (index) => Expanded(
                          child: GreenIcon(
                              size: size,
                              text: list[index].text,
                              icon: list[index].icon),
                        )),
              ),
            ]),
      ),
    );
  }
}
