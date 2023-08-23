import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/app_colors.dart';
import 'package:listenlit/features/explore/screens/widgets/bookcard_widget.dart';
import 'package:listenlit/features/library/data/book_model.dart';

import 'detail_screen.dart';

class ProductListingScreen extends StatelessWidget {
  final String title;
  final List<BookModel> bookModelList;
  const ProductListingScreen({
    Key? key,
    required this.bookModelList,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBlackColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 23.sp,
            color: AppColor.kLightAccentColor,
          ),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 258.w),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 36.sp,
              color: AppColor.kLightAccentColor,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h).copyWith(
              bottom: 0,
            ),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.45, // Adjust this value as needed
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: bookModelList.length,
              itemBuilder: (context, index) {
                BookModel bookModel = bookModelList[index];
                return GestureDetector(
                    onTap: () {
                      Get.to(() => BookDetailScreen(
                            bookModel: bookModel,
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: BookCardWidget(bookModel: bookModel),
                    ));
              },
            ),
          ),
        )
      ]),
    );
  }
}
