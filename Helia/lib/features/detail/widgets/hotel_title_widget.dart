import 'package:flutter/material.dart';
import 'package:helia/core/models/hotel_model.dart';
import 'package:helia/core/resources/colors.dart';
import 'package:helia/core/resources/dimns.dart';
import 'package:iconsax/iconsax.dart';

class HotelName extends StatelessWidget {
  const HotelName({
    super.key,
    required this.size,
    required this.hotel,
  });

  final Size size;
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(AppDimns.medium),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hotel.name,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: AppDimns.medium,
            ),
            Row(
              children: [
                const Icon(
                  Iconsax.location5,
                  color: AppColors.primary,
                ),
                const SizedBox(
                  width: AppDimns.small,
                ),
                Text(
                  hotel.country,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
