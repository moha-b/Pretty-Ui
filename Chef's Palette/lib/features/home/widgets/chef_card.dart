import 'package:chef/core/resources/dimns.dart';
import 'package:chef/core/resources/sizes.dart';
import 'package:chef/features/home/models/chef_model.dart';
import 'package:flutter/material.dart';

class ChefCard extends StatelessWidget {
  const ChefCard({
    super.key,
    required this.chef,
  });
  final Chef chef;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(80),
      padding: const EdgeInsets.all(AppDimns.small),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimns.medium),
          border: Border.all(width: 1),
          color: Theme.of(context).colorScheme.secondary),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: getScreenHeight(60),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimns.medium),
                border: Border.all(width: 1),
                image: DecorationImage(
                    image: AssetImage(chef.image), fit: BoxFit.contain)),
          ),
          const SizedBox(height: AppDimns.small),
          Text(chef.name, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
