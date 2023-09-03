import 'package:flutter/material.dart';
import 'package:swipe/features/home/screens/widgets/circle_painter.dart';
import 'package:swipe/features/home/screens/widgets/image_widget.dart';

import '../ data/Book.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<Book> books = Books().bookList;

  int index = 0;
  late AnimationController _controller;
  late Animation<double> curve;
  late Animation<Color?> _colorAnimationRed;
  late Animation<Color?> _colorAnimationGreen;
  late Animation<double?> _size;
  late Animation<double?> _opacity;
  bool left = false;
  bool right = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,

      duration: const Duration(milliseconds: 1000),
      // Animation duration
    );

    curve = CurvedAnimation(parent: _controller, curve: Curves.ease);

    _colorAnimationRed =
        ColorTween(begin: Colors.white, end: Colors.red).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          0.10,
          curve: Curves.ease,
        ),
      ),
    );

    _colorAnimationGreen =
        ColorTween(begin: Colors.white, end: Colors.green).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          0.10,
          curve: Curves.ease,
        ),
      ),
    );

    _size = Tween<double>(
      begin: 100.0,
      end: 1000.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );

    _opacity = Tween<double>(
      begin: 1.0,
      end: 0.1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.5,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              right: -250,
              top: 50,
              bottom: 220,
              child: right
                  ? AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return CustomPaint(
                          painter: CirclePainter(_colorAnimationRed.value!
                              .withOpacity(_opacity.value!)),
                          size: Size(_size.value!, _size.value!),
                        );
                      },
                    )
                  : Container(),
            ),
            Positioned(
              left: -250,
              top: 50,
              bottom: 220,
              child: left
                  ? AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return CustomPaint(
                          painter: CirclePainter(_colorAnimationGreen.value!
                              .withOpacity(_opacity.value!)),
                          size: Size(_size.value!, _size.value!),
                        );
                      },
                    )
                  : Container(),
            ),
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 30,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.grey,
                    ),
                    Icon(Icons.album_rounded),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              bottom: 220,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Stack(
                  children: [
                    ImageWidget(books[3].img),
                    ImageWidget(books[2].img),
                    ImageWidget(books[1].img),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 10,
                      child: GestureDetector(
                        onHorizontalDragEnd: (details) {
                          debugPrint("is completed ${_controller.isCompleted}");
                          _controller.addListener(() {
                            if (_controller.isCompleted) {
                              _controller.reset();
                              setState(() {
                                Book first = books.first;
                                books.removeAt(0);
                                books.add(first);
                              });
                            }
                          });
                        },
                        onHorizontalDragUpdate: (DragUpdateDetails details) {
                          debugPrint("drag ${details.delta.dx}");
                          if (details.delta.dx.isNegative) {
                            setState(() {
                              left = true;
                              right = false;
                            });
                          } else {
                            setState(() {
                              left = false;
                              right = true;
                            });
                          }
                          _controller.forward();
                        },
                        child: AnimatedBuilder(
                          animation: curve,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: left
                                  ? Offset(curve.value * -360.0, 0.0)
                                  : Offset(curve.value * 360.0, 0.0),
                              child: child,
                            );
                          },
                          child: ImageWidget(books.first.img),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          books[index].name,
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          books[index].author,
                          style:
                              const TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(books[0].category,
                            style: const TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
