import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helia/core/models/hotel_model.dart';
import 'package:helia/core/resources/dimns.dart';
import 'package:helia/core/resources/images.dart';
import 'package:helia/core/resources/strings.dart';
import 'package:helia/features/common/categories.dart';
import 'package:helia/features/common/hotel_card_widget.dart';
import 'package:helia/features/common/search_field_widget.dart';
import 'package:helia/features/common/section_title.dart';
import 'package:helia/features/home/widgets/categroies_items_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppDimns.big),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(right: AppDimns.small),
                      padding: const EdgeInsets.all(AppDimns.small),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppDimns.medium),
                        gradient: LinearGradient(
                          colors: [
                            Colors.green.shade200,
                            Colors.green.shade400
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Image.asset(AppImages.lightLogo),
                    ),
                    Text(
                      AppStrings.application,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.notification),
                    SizedBox(width: 16),
                    SvgPicture.asset(AppImages.bookmark),
                  ],
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            Wrap(
              children: [
                Text(
                  AppStrings.welcomeText,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 35),
                ),
              ],
            ),
            const SearchField(),
            SizedBox(
              height: size.height * 0.06,
              child: const Categories(),
            ),
            CategoriesItems(
              hotels: hotels,
            ),
            SectionTitle(
              text: "Recently Booked",
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              reverse: true,
              itemBuilder: (context, index) => HotelCard(
                size: size,
                hotel: hotels[index],
                index: index,
              ),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppDimns.medium),
              itemCount: hotels.length,
            )
          ],
        ),
      ),
    );
  }
}
