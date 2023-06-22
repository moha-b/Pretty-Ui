import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readify/core/models/category_model.dart';
import 'package:readify/core/resources/dimn.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.category}) : super(key: key);
  final AppCategory category;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            width: size.width * 0.16,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: category.color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppDimns.small),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(category.image, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Expanded(child: Text(category.name)),
      ],
    );
  }
}
