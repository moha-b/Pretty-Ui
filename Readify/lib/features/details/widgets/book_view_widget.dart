import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readify/core/models/book_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/resources/dimn.dart';

class BookView extends StatelessWidget {
  const BookView({
    super.key,
    required this.book,
  });
  final Book book;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppDimns.medium),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    const Icon(
                      FontAwesomeIcons.heart,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                        controller: controller,
                        children: List.generate(
                          3,
                          (index) => FittedBox(
                            fit: BoxFit.contain,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(AppDimns.medium),
                              child: Image.asset(
                                book.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: AppDimns.medium),
                    child: SmoothPageIndicator(
                        effect: WormEffect(
                            activeDotColor: Colors.green.shade900,
                            dotWidth: 8,
                            dotHeight: 8),
                        controller: controller,
                        count: 3),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: AppDimns.medium,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppDimns.big),
                    topLeft: Radius.circular(AppDimns.big),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
