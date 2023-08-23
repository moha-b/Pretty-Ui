import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/utils.dart';
import 'package:listenlit/features/home/data/chip_model.dart';
import 'package:listenlit/features/library/data/book_model.dart';
import 'package:listenlit/features/library/screens/widgets/library_bookcard_widget.dart';
import 'package:listenlit/features/profile/data/usermodel.dart';

import '../../../core/common/chip_card.dart';
import '../../explore/screens/detail_screen.dart';

class MyLibraryScreen extends StatefulWidget {
  const MyLibraryScreen({Key? key}) : super(key: key);

  @override
  _MyLibraryScreenState createState() => _MyLibraryScreenState();
}

class _MyLibraryScreenState extends State<MyLibraryScreen> {
  int onSelect = 0;
  List<BookModel> get savedBooksList => currentUser.savedBooks
      .map((savedId) =>
          bookModelList.firstWhere((element) => element.bookId == savedId))
      .toList();

  List<BookModel> get inProgressList => currentUser.readingProgress.keys
      .map((savedId) =>
          bookModelList.firstWhere((element) => element.bookId == savedId))
      .toList();
  List<BookModel> get completedList => currentUser.readingProgress.values
      .map((bookProgressModel) => bookModelList
          .firstWhere((element) => element.bookId == bookProgressModel.bookId))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h, left: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12.h, left: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Library',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.kWhiteColor,
                    fontFamily: 'Inter',
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                SvgPicture.asset(
                  AppIcons.kLinearLine,
                  width: 112.w,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                myLibraryChipList.length,
                (index) => ChipCard(
                  chipModel: myLibraryChipList[index],
                  onPressed: () {
                    setState(() {
                      onSelect = index;
                    });
                  },
                  backgroundColor:
                      onSelect == index ? AppColor.kPrimary : AppColor.kBGColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 24.h, right: 16.w),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.h,
                  childAspectRatio: 0.52, // Adjust this value as needed
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: getListBySelectedChip().length,
                itemBuilder: (context, index) {
                  BookModel libraryModel = getListBySelectedChip()[index];

                  return GestureDetector(
                    onTap: () {
                      Get.to(() => BookDetailScreen(bookModel: libraryModel));
                    },
                    child: LibraryBookCardWidget(
                      book: libraryModel,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  List<BookModel> getListBySelectedChip() {
    if (onSelect == 0) {
      return savedBooksList;
    } else if (onSelect == 1) {
      return inProgressList;
    } else if (onSelect == 2) {
      return completedList;
    } else {
      return []; // Return an empty list if the index is invalid
    }
  }
}
