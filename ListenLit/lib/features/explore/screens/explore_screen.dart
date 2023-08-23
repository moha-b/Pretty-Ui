// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:listenlit/core/utils/app_colors.dart';
import 'package:listenlit/core/utils/icons_path.dart';
import 'package:listenlit/features/explore/screens/productlisting_screen.dart';
import 'package:listenlit/features/explore/screens/widgets/build_exploreheader.dart';
import 'package:listenlit/features/explore/screens/widgets/topic_container.dart';
import 'package:listenlit/features/library/data/book_model.dart';

import '../../../core/common/postcard_widget.dart';
import '../../../core/common/primarytextfield.dart';
import '../../../core/common/rowtext_showbutton_widget.dart';
import 'detail_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();
  // List<String> topsList = Genres.values.map((e) => get(e)).toList();
  List<String> topsList = [
    'Personal growth',
    'Culture & Society',
    'Fiction',
    'Mind & Philosophy',
    'Health & Fitness',
    'Biographies',
    'Education',
    'History',
    'Future',
    'harry',
    'Life style'
  ];
  List<BookModel> searchResults = [];
  bool isSearchOn = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(performSearch);
  }

  @override
  void dispose() {
    _searchController.removeListener(performSearch);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 57.h,
        left: 16.w,
        right: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BuildExploreHeader(),
          SizedBox(
            height: 25.h,
          ),
          PrimaryTextFormField(
            hintText: 'Title, author or keyword',
            controller: _searchController,
            width: 350.w,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: AppColor.kGrey2Color,
                )),
            fillColor: AppColor.kGrey3Color,
            borderRadius: 8.r,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide:
                    BorderSide(color: AppColor.kGrey2Color, width: 1.w)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColor.kPrimary, width: 1.w)),
            focusedErrorBorder: const OutlineInputBorder(),
            errorBorder: const OutlineInputBorder(),
            height: 48.h,
            prefixIcon: isSearchOn
                ? GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      isSearchOn = false;
                      setState(() {});
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColor.kLightAccentColor,
                    ),
                  )
                : Icon(
                    Icons.search_outlined,
                    color: AppColor.kLightAccentColor,
                  ),
            onChanged: (value) {
              isSearchOn = true;
            },
          ),
          if (isSearchOn)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    'Search results',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                        color: AppColor.kWhiteColor),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        BookModel model = searchResults[index];
                        return ListTile(
                          onTap: () {
                            Get.to(() => BookDetailScreen(bookModel: model));
                          },
                          contentPadding: EdgeInsets.only(top: 16.h),
                          title: Text(
                            model.bookName,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.kLightAccentColor,
                              fontFamily: 'Inter',
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                model.authorName,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.kLightAccentColor,
                                  fontFamily: 'Inter',
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppIcons.kmusicIcon,
                                          width: 12.w,
                                          height: 12.h,
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text(
                                          '${model.listenTime}m',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: AppColor.kLightAccentColor,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Inter',
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppIcons.kGlasses),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text(
                                          '${model.readTime}m',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: AppColor.kLightAccentColor,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Inter',
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          leading: Image.asset(model.bookImage),
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  searchResults.removeAt(index);
                                  isSearchOn = true;
                                });
                              },
                              icon: SvgPicture.asset(
                                AppIcons.kCancelIcon,
                              )),
                          // Add any additional UI components for each search result
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          else
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 40.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: SizedBox(
                      width: 350.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Topics',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: AppColor.kWhiteColor,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Wrap(
                            children: List.generate(
                              topsList.length,
                              (index) {
                                return TopicContainer(
                                    topsList: topsList[index],
                                    isSearchOn: isSearchOn,
                                    onTap: () {
                                      setState(() {
                                        _searchController.text =
                                            topsList[index];
                                        isSearchOn =
                                            _searchController.text.isNotEmpty;
                                      });
                                    });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 13.h),
                    child: RowTextShowButton(
                      title: 'Fiction',
                      textButtonText: 'Show all',
                      onPressed: () {
                        Get.to(() => ProductListingScreen(
                              title: 'Fiction',
                              bookModelList: bookModelList,
                            ));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: SizedBox(
                      height: 270.h,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: List.generate(
                          bookModelList.length,
                          (index) => GestureDetector(
                            onTap: () {
                              Get.to(() => BookDetailScreen(
                                  bookModel: bookModelList[index]));
                            },
                            child: PostCardWidget(
                                trendingModel: bookModelList[index]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 13.h),
                    child: RowTextShowButton(
                      title: 'Culture & Society',
                      textButtonText: 'Show all',
                      onPressed: () {
                        Get.to(
                          () => ProductListingScreen(
                            title: 'Life style',
                            bookModelList: bookModelList,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: SizedBox(
                      height: 270.h,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: List.generate(
                          bookModelList.length,
                          (index) => GestureDetector(
                            onTap: () {
                              Get.to(() => BookDetailScreen(
                                  bookModel: bookModelList[index]));
                            },
                            child: PostCardWidget(
                                trendingModel: bookModelList[index]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 13.h),
                    child: RowTextShowButton(
                      title: 'Life style',
                      textButtonText: 'Show all',
                      onPressed: () {
                        Get.to(
                          () => ProductListingScreen(
                            title: 'Life style',
                            bookModelList: bookModelList,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: SizedBox(
                      height: 270.h,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: List.generate(
                          bookModelList.length,
                          (index) => GestureDetector(
                            onTap: () {
                              Get.to(() => BookDetailScreen(
                                  bookModel: bookModelList[index]));
                            },
                            child: PostCardWidget(
                                trendingModel: bookModelList[index]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void performSearch() {
    String searchText = _searchController.text;
    setState(() {
      searchResults = searchTrendingList(searchText) ?? [];
      isSearchOn = _searchController.text.isNotEmpty;
    });
  }

  List<BookModel>? searchTrendingList(String searchText) {
    searchText = searchText.toLowerCase();
    List<BookModel> searchResults = bookModelList.where((model) {
      String bookName = model.bookName.toLowerCase();
      String authName = model.authorName.toLowerCase();
      String genres = model.genre.name.toLowerCase();

      return bookName.contains(searchText) ||
          authName.contains(searchText) ||
          genres.contains(searchText);
    }).toList();
    return searchResults;
  }
}
