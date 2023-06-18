import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helia/core/models/hotel_model.dart';
import 'package:helia/core/resources/colors.dart';
import 'package:helia/core/resources/dimns.dart';
import 'package:helia/core/resources/images.dart';
import 'package:helia/features/detail/widgets/invisible_expanded_header_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({
    super.key,
    required this.size,
    required this.hotel,
  });

  final Size size;
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();
    return SliverAppBar(
      expandedHeight: size.height * 0.28,
      backgroundColor: AppColors.primary,
      pinned: true,
      title: InvisibleExpandedHeader(child: Text(hotel.name)),
      actions: [
        SvgPicture.asset(
          AppImages.bookmark,
          color: Colors.white,
        ),
        const SizedBox(
          width: AppDimns.medium,
        ),
        const Icon(Iconsax.voice_cricle),
        const SizedBox(
          width: AppDimns.medium,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            PageView(
              controller: _controller,
              children: List.generate(
                hotel.images.length,
                (index) => Image.asset(hotel.images[index], fit: BoxFit.cover),
              ),
            ),
            Container(
              alignment: const Alignment(0, 0.9),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 5,
                effect: const ExpandingDotsEffect(
                  dotWidth: AppDimns.medium,
                  dotHeight: AppDimns.small,
                  activeDotColor: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
