import 'package:flutter/material.dart';
import 'package:helia/core/models/hotel_model.dart';
import 'package:helia/core/resources/dimns.dart';
import 'package:helia/core/resources/images.dart';
import 'package:helia/features/detail/widgets/description.dart';
import 'package:helia/features/detail/widgets/detail_app_bar_widget.dart';
import 'package:helia/features/detail/widgets/details_widget.dart';
import 'package:helia/features/detail/widgets/facilities.dart';
import 'package:helia/features/detail/widgets/gallery_photos_widget.dart';
import 'package:helia/features/detail/widgets/hotel_title_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.hotel});
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DetailAppBar(size: size, hotel: hotel),
          HotelName(size: size, hotel: hotel),
          GalleryPhotos(size: size),
          HotelProperties(size: size, title: "Details", list: details),
          const Description(),
          Facilities(size: size),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppDimns.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Location",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: AppDimns.medium),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(AppDimns.medium),
                      child: Image.asset(AppImages.map)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
