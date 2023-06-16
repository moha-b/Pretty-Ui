import 'package:flutter/material.dart';
import 'package:helia/core/resources/dimns.dart';
import 'package:helia/core/resources/images.dart';

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.45,
      child: ListView.separated(
        padding: EdgeInsets.only(top: AppDimns.medium),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: size.width * 0.65,
          padding: const EdgeInsets.all(AppDimns.big),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.onboarding1), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(AppDimns.large),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 1,
                right: 1,
                child: Text(
                  'Rate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Positioned(
                bottom: 1,
                left: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Text 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Text 2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: AppDimns.medium),
        itemCount: 3,
      ),
    );
  }
}
