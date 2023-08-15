import 'package:carousel_slider/carousel_slider.dart';
import 'package:door_hub/features/home/data/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/containers/primary_container.dart';
import 'offers_card.dart';

class OfferList extends StatelessWidget {
  const OfferList({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
        height: 200.h,
        padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
        child: CarouselSlider(
          options: CarouselOptions(
              height: 200.h,
              autoPlay: true,
              viewportFraction: 0.9,
              autoPlayAnimationDuration: const Duration(seconds: 2)),
          items: offerList.map((offer) {
            return Builder(
              builder: (BuildContext context) {
                return OffersCard(
                  offerOn: offer.offerOn,
                  amount: offer.amount,
                  color: offer.color,
                );
              },
            );
          }).toList(),
        ));
  }
}
