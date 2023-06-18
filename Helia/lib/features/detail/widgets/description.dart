import 'package:flutter/material.dart';

import '../../../core/resources/dimns.dart';
import '../../../core/resources/strings.dart';
import 'expanded_text.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(AppDimns.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: AppDimns.medium,
            ),
            ExpandableText(text: AppStrings.description),
          ],
        ),
      ),
    );
  }
}
