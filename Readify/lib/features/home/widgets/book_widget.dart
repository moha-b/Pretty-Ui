import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:readify/core/models/book_model.dart';
import 'package:readify/core/resources/dimn.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Transform.rotate(
              angle: -math.pi / 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppDimns.medium),
                child: Image.asset(
                  book.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            book.name,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: 4),
          Text(
            book.author,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
