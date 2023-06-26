import 'package:chef/core/resources/colors.dart';
import 'package:chef/core/resources/dimns.dart';
import 'package:chef/features/detail/widgets/video_section_widget.dart';
import 'package:flutter/material.dart';

import 'chat_section_widget.dart';
import 'ingredient_section_widget.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Expanded(
            child: VideoSection(),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(AppDimns.medium),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(AppDimns.big)),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(AppDimns.big),
                      border: Border.all(width: 0.5),
                    ),
                    labelColor: Colors.black,
                    tabs: const [
                      Tab(text: "Chat"),
                      Tab(text: "Ingredients"),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      ChatSection(),
                      IngredientSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
