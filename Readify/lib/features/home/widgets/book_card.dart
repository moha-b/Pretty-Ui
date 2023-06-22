import 'package:flutter/material.dart';
import 'package:readify/core/resources/dimn.dart';

import '../../../core/models/book_model.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1.5,
      padding: const EdgeInsets.all(AppDimns.small),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimns.small),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: -1,
            color: Colors.grey.withOpacity(0.4),
          ),
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 1,
            spreadRadius: -1,
            color: Colors.grey.withOpacity(0.2),
          ),
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimns.small),
            child: Image.asset(book.image),
          ),
          const SizedBox(width: AppDimns.small),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
                Text(book.author, style: const TextStyle(color: Colors.grey)),
                Text(book.rate,
                    style: const TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
