import 'package:flutter/material.dart';
import 'package:helia/core/models/hotel_model.dart';
import 'package:helia/core/resources/dimns.dart';
import 'package:helia/features/common/section_title.dart';

class GalleryPhotos extends StatelessWidget {
  const GalleryPhotos({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: size.height * 0.2,
        margin: const EdgeInsets.symmetric(vertical: AppDimns.small),
        padding: const EdgeInsets.all(AppDimns.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(text: "Gallery Photos"),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => AspectRatio(
                        aspectRatio: 3 / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppDimns.medium),
                          child: Image.asset(
                            hotelGallery[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) =>
                      SizedBox(width: AppDimns.medium),
                  itemCount: hotelGallery.length),
            )
          ],
        ),
      ),
    );
  }
}
