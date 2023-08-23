import 'package:flutter/material.dart';
import 'package:listenlit/core/utils/app_colors.dart';
import 'package:listenlit/features/explore/screens/widgets/bookdetails_container.dart';
import 'package:listenlit/features/explore/screens/widgets/image_overlay_container.dart';
import 'package:listenlit/features/explore/screens/widgets/premiumplaybackcontainer.dart';
import 'package:listenlit/features/library/data/book_model.dart';
import 'package:listenlit/features/library/data/mylibrary_model.dart';

import '../../../core/helper/selectgenreslist.dart';

class BookDetailScreen extends StatefulWidget {
  BookModel bookModel;
  BookProgressModel? libraryModel;
  BookDetailScreen({super.key, this.libraryModel, required this.bookModel});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  List<String> topsList = Genres.values.map((e) => get(e)).toList();

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBGColor,
      body: Stack(
        children: [
          ImageOverlayContainer(
            backGroundImage: widget.bookModel.bookImage,
            forGroundImage: widget.bookModel.bookImage,
          ),
          //Bottom Container
          BookDetailsContainer(
            bookModel: widget.bookModel,
          ),

          PremiumPlaybackContainer(
            bookModel: widget.bookModel,
          )
        ],
      ),
    );
  }
}
