import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readify/core/models/category_model.dart';
import 'package:readify/core/resources/dimn.dart';
import 'package:readify/core/resources/images.dart';
import 'package:readify/core/resources/strings.dart';
import 'package:readify/features/details/detail_screen.dart';
import 'package:readify/features/home/widgets/book_card.dart';
import 'package:readify/features/home/widgets/book_widget.dart';
import 'package:readify/features/home/widgets/category_card_widget.dart';
import 'package:readify/features/home/widgets/icon_widget.dart';
import 'package:readify/features/home/widgets/section_widget.dart';

import '../../core/models/book_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconWidget(icon: AppImages.categories),
            IconWidget(icon: AppImages.search),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimns.medium),
          child: Column(
            children: [
              SizedBox(
                  height: size.height * 0.17,
                  child: SectionWidget(
                    title: AppStrings.categories,
                    isViewAll: false,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            CategoryCard(category: categories[index]),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: AppDimns.medium),
                        itemCount: categories.length),
                  )),
              SizedBox(
                height: size.height * 0.4,
                child: SectionWidget(
                  title: AppStrings.popular,
                  isViewAll: true,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(book: books[index]),
                            ));
                      },
                      child: BookWidget(
                        book: books[index],
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: AppDimns.medium),
                    itemCount: books.length,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.21,
                child: SectionWidget(
                  title: AppStrings.trending,
                  isViewAll: true,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 8),
                    itemBuilder: (context, index) {
                      List<Book> book = books;
                      book.reversed;
                      return BookCard(book: book[index]);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: AppDimns.medium),
                    itemCount: books.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house), label: ""),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.heart), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.lock_rounded), label: ""),
        ],
      ),
    );
  }
}
