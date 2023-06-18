import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helia/core/models/hotel_model.dart';
import 'package:helia/core/resources/colors.dart';
import 'package:helia/core/resources/dimns.dart';
import 'package:helia/core/resources/images.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
    required this.size,
    required this.hotel,
    required this.index,
  });
  final Hotel hotel;
  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.13,
      padding: const EdgeInsets.all(AppDimns.medium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimns.medium),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: AppDimns.medium),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimns.medium),
              child: AspectRatio(
                aspectRatio: 1.1,
                child: Image.asset(
                  hotel.images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotel.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  hotel.country,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColors.primary,
                    ),
                    text: "⭐ ${hotel.rate}",
                    children: [
                      TextSpan(
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          text: " (${hotel.reviews})"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                hotel.price,
                style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              const Text(
                "/ night",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              SvgPicture.asset(
                hotel.icon ? AppImages.bookmarkFill : AppImages.bookmark,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
