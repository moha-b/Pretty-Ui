import 'package:chef/core/resources/dimns.dart';
import 'package:chef/core/resources/images.dart';
import 'package:chef/core/resources/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppDimns.medium),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(AppDimns.big),
          border: Border.all(width: 1)),
      child: Padding(
        padding: EdgeInsets.all(getScreenHeight(AppDimns.medium)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppImages.search,
              fit: BoxFit.contain,
              width: 20,
              height: 20,
            ),
            SizedBox(
              width: getScreenWidth(AppDimns.medium),
            ),
            const Text(
              "Try to find...",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
