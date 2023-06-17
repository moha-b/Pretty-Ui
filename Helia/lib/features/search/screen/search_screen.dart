import 'package:flutter/material.dart';
import 'package:helia/core/models/hotel_model.dart';
import 'package:helia/core/resources/dimns.dart';
import 'package:helia/features/common/categories.dart';
import 'package:helia/features/common/hotel_card_widget.dart';
import 'package:helia/features/common/search_field_widget.dart';
import 'package:iconsax/iconsax.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(AppDimns.medium),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.06),
          const SearchField(),
          const Expanded(child: Categories()),
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended (589,033)",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Icon(Iconsax.document_text),
                    SizedBox(width: 8),
                    Icon(Iconsax.category),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    HotelCard(size: size, hotel: hotels[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: AppDimns.medium),
                itemCount: hotels.length),
          ),
        ],
      ),
    );
  }
}
