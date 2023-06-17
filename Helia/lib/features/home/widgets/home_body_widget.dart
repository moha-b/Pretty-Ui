import 'package:flutter/material.dart';
import 'package:helia/core/models/hotel_model.dart';
import 'package:helia/core/resources/dimns.dart';
import 'package:helia/core/resources/strings.dart';
import 'package:helia/features/common/categories.dart';
import 'package:helia/features/common/hotel_card_widget.dart';
import 'package:helia/features/common/search_field_widget.dart';
import 'package:helia/features/home/widgets/categroies_items_widget.dart';
import 'package:helia/features/home/widgets/section_title.dart';

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
            Wrap(
              children: [
                Text(
                  AppStrings.welcomeText,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 40),
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
            const SectionTitle(),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              reverse: true,
              itemBuilder: (context, index) => HotelCard(
                size: size,
                hotel: hotels[index],
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
