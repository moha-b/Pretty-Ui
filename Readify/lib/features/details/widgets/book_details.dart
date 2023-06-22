import 'package:flutter/material.dart';

import '../../../core/models/book_model.dart';
import '../../../core/resources/dimn.dart';
import '../../../core/resources/strings.dart';
import 'expanded_text.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(AppDimns.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.name,
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: AppDimns.small),
                  Text(
                    book.author,
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                book.price,
                style: const TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            margin: const EdgeInsets.symmetric(vertical: AppDimns.medium),
            decoration: BoxDecoration(
              border: Border.all(width: 0.7, color: Colors.grey),
              borderRadius: BorderRadius.circular(AppDimns.medium),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      book.pages,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    const Text("Pages"),
                  ],
                ),
                const VerticalDivider(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      book.rate,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    const Text("Rating"),
                  ],
                ),
                const VerticalDivider(),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "English",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 5),
                    Text("Language"),
                  ],
                ),
              ],
            ),
          ),
          const Text(
            AppStrings.description,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const ExpandableText(text: AppStrings.bookDescription),
          const SizedBox(height: 50),
          Expanded(
            child: Row(
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: const Color(0xffFDEAEC),
                  elevation: 0,
                  child: const Icon(Icons.lock_outline, color: Colors.pink),
                ),
                const SizedBox(
                  width: AppDimns.medium,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.73,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text("Buy Now",
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
