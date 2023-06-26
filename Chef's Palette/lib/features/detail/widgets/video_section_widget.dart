import 'package:chef/core/common/circle_container.dart';
import 'package:chef/core/resources/dimns.dart';
import 'package:chef/core/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VideoSection extends StatelessWidget {
  const VideoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(AppDimns.medium),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppDimns.big),
            bottomRight: Radius.circular(AppDimns.big)),
        image: DecorationImage(
            image: AssetImage(AppImages.food2), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleContainer(icon: AppImages.arrowLeft),
              CircleContainer(
                icon: AppImages.info,
                padding: AppDimns.small,
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppDimns.small),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1),
                ),
              ),
              const SizedBox(width: AppDimns.small),
              const Text("Live",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              const Spacer(),
              const Text("1,349 viewers",
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              const SizedBox(width: AppDimns.medium),
              SvgPicture.asset(
                AppImages.expand,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
