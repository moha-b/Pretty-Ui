import 'package:flutter/material.dart';
import 'package:readify/core/models/book_model.dart';
import 'package:readify/features/details/widgets/book_details.dart';
import 'package:readify/features/details/widgets/book_view_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.greenAccent.shade100,
              child: BookView(book: book),
            ),
            Expanded(
              child: BookDetails(book: book),
            ),
          ],
        ),
      ),
    );
  }
}
