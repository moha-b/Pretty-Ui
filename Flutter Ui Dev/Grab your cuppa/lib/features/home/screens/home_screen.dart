import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/coffee_item.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> data = [];
  int count = 0;
  bool _isExpanded = true;

  void _onItemFocus(int index) {
    if (kDebugMode) {
      print(index);
    }
    setState(() {});
  }

  void setExpand(bool expand) {
    setState(() {
      _isExpanded = !expand;
      if (_isExpanded) {
        count--;
      } else {
        count++;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < items.length; i++) {
      data.add(Random().nextInt(100) + 1);
    }
  }

  Widget _buildListItem(BuildContext context, int index, int realIndex) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CoffeeWidget(index: index, callback: setExpand),
          Text(
            items[index].name,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                color: Colors.brown.shade800,
                fontSize: 30,
                fontWeight: FontWeight.w900),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: kToolbarHeight * 3,
        title: Column(
          children: [
            ArcText(
              text: "B A R I S T A",
              radius: 10,
              textStyle: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "COFFEE",
              style: GoogleFonts.lato(
                  color: Colors.brown,
                  fontSize: 12,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          final width = constraints.maxWidth;

          return Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                bottom: _isExpanded ? height * 0.2 : height * 0.15,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    AnimatedScale(
                      duration: const Duration(milliseconds: 400),
                      scale: _isExpanded ? 0.8 : 0.7,
                      child: Image.asset(
                        "assets/coffee/plate.png",
                      ),
                    ),
                    Container(
                      width: width * 0.4,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 15.0,
                            blurStyle: BlurStyle.normal,
                            spreadRadius: -8.0,
                          ),
                        ],
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.transparent),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                child: CarouselSlider.builder(
                  carouselController: CarouselController(),
                  itemCount: items.length,
                  itemBuilder: _buildListItem,
                  options: CarouselOptions(
                    height: height,
                    viewportFraction: 0.5,
                    enlargeCenterPage: false,
                    initialPage: 0,
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    scrollPhysics: const PageScrollPhysics(),
                    onPageChanged: (index, reason) {
                      _onItemFocus(index);
                    },
                    pageSnapping: true,
                  ),
                ),
              ),
              AnimatedPositioned(
                top: _isExpanded ? height * 0.42 : height * 0.8,
                left: width * 0.2,
                right: width * 0.2,
                duration: const Duration(milliseconds: 500),
                child: AnimatedDefaultTextStyle(
                  style: GoogleFonts.lato(
                      color: Colors.brown,
                      fontSize: _isExpanded ? 16 : 0,
                      fontWeight: FontWeight.bold),
                  duration: const Duration(milliseconds: 500),
                  child: const Center(child: Text("Drag Your Cuppa")),
                ),
              ),
              AnimatedPositioned(
                bottom: height * 0.09,
                right: _isExpanded ? -width * 0.15 : width * 0.03,
                duration: const Duration(milliseconds: 500),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.brown,
                  size: 36,
                ),
              ),
              AnimatedPositioned(
                top: _isExpanded ? height * 0.5 : height * 0.6,
                left: 0,
                right: 0,
                duration: const Duration(milliseconds: 500),
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.brown,
                  size: _isExpanded ? 36 : 0,
                ),
              ),
              Positioned(
                bottom: height * 0.09,
                left: 0,
                right: 0,
                child: AnimatedCounter(
                  isExpanded: _isExpanded,
                  count: count,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
