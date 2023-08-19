import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';

import '../../../core/helper/data.dart';

class RecentSearch extends StatefulWidget {
  const RecentSearch({super.key});

  @override
  State<RecentSearch> createState() => _RecentSearchState();
}

class _RecentSearchState extends State<RecentSearch> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text(
              "RECENT",
              style: AppTypography.kExtraLight15,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                recentSearch.clear();
                setState(() {});
              },
              child: Text(
                'CLEAR',
                style:
                    AppTypography.kLight14.copyWith(color: AppColors.kPrimary),
              ),
            ),
          ]),
          recentSearch.isNotEmpty
              ? ListView.builder(
                  itemCount: recentSearch.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, i) {
                    return Text(
                      recentSearch[i],
                      style: AppTypography.kLight14
                          .copyWith(color: AppColors.kLightBrown),
                    );
                  })
              : Center(
                  child: Text(
                    "NO RECENT SEARCH",
                    style: AppTypography.kLight14
                        .copyWith(color: AppColors.kLightBrown),
                  ),
                ),
          SizedBox(height: 20.h),
          Text(
            "POPULAR",
            style: AppTypography.kExtraLight15,
          ),
          ListView.builder(
              itemCount: popularSearch.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) {
                return Text(
                  popularSearch[i],
                  style: AppTypography.kLight14
                      .copyWith(color: AppColors.kLightBrown),
                );
              }),
        ],
      ),
    );
  }
}
