import 'package:chef/core/common/circle_container.dart';
import 'package:chef/core/resources/colors.dart';
import 'package:chef/core/resources/dimns.dart';
import 'package:chef/core/resources/images.dart';
import 'package:chef/core/resources/sizes.dart';
import 'package:chef/features/detail/widgets/detail_body_widget.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: const DetailBody(),
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(AppDimns.small),
          height: getScreenHeight(100),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: getScreenHeight(90) / 2,
                  padding: const EdgeInsets.only(left: AppDimns.medium),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(AppDimns.big),
                  ),
                  alignment: Alignment.centerLeft,
                  child: const Text("Message...",
                      style: TextStyle(color: Colors.grey)),
                ),
              ),
              const Expanded(
                  child: CircleContainer(
                icon: AppImages.arrowUp,
                backgroundColor: AppColors.green,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
