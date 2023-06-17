import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helia/core/models/hotel_model.dart';
import 'package:helia/core/resources/colors.dart';
import 'package:helia/core/resources/dimns.dart';
import 'package:helia/core/resources/images.dart';

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({super.key, required this.hotels});
  final List<Hotel> hotels;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.45,
      child: ListView.separated(
        padding: const EdgeInsets.only(top: AppDimns.medium),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: size.width * 0.65,
          padding: const EdgeInsets.all(AppDimns.big),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(hotels[index].image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(AppDimns.large),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 1,
                right: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(
                        AppDimns.medium,
                      )),
                  padding: const EdgeInsets.all(AppDimns.small),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.white, size: 15),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        hotels[index].rate,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 1,
                left: 1,
                right: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotels[index].name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      hotels[index].country,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: hotels[index].price,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                              TextSpan(
                                  text: " / night",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          AppImages.bookmark,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppDimns.medium),
        itemCount: hotels.length,
      ),
    );
  }
}
