import 'package:chef/core/resources/dimns.dart';
import 'package:chef/features/home/models/chef_model.dart';
import 'package:flutter/material.dart';

import 'chef_card.dart';

class ListOfChefs extends StatelessWidget {
  const ListOfChefs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: chefList.length,
      itemBuilder: (context, index) => ChefCard(
        chef: chefList[index],
      ),
      separatorBuilder: (context, index) =>
          const SizedBox(width: AppDimns.medium),
    );
  }
}
