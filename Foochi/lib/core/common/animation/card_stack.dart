import 'package:flutter/material.dart';

class CardStack extends StatefulWidget {
  final Function(int) onCardChanged;
  final List<Widget> children;
  final Widget Function(int) cardBuilder;
  final int stackLength;

  const CardStack({
    Key? key,
    required this.children,
    required this.onCardChanged,
    required this.cardBuilder,
    required this.stackLength,
  }) : super(key: key);

  @override
  _CardStackState createState() => _CardStackState();
}

class _CardStackState extends State<CardStack> with SingleTickerProviderStateMixin {
  late int currentIndex;
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;
  late Animation<Offset> _translationAnim;
  late Animation<Offset> _moveAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeOut);

    _translationAnim =
        Tween(begin: const Offset(0.0, 0.0), end: const Offset(-1000.0, 0.0))
            .animate(controller)
              ..addListener(() {
                setState(() {});
              });

    _scaleAnim = Tween(begin: 0.965, end: 1.0).animate(curvedAnimation);
    _moveAnim =
        Tween(begin: const Offset(0.0, 0.05), end: const Offset(0.0, 0.0))
            .animate(curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: widget.children.reversed.map((card) {
        final index = widget.children.indexOf(card);
        if (index <= widget.stackLength - 1) {
          return GestureDetector(
            onHorizontalDragEnd: _horizontalDragEnd,
            child: Transform.translate(
              offset: _getFlickTransformOffset(index),
              child: FractionalTranslation(
                translation: _getStackedCardOffset(index),
                child: Transform.scale(
                  scale: _getStackedCardScale(index),
                  child: Center(child: widget.cardBuilder(index)),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      }).toList(),
    );
  }

  Offset _getStackedCardOffset(int index) {
    int diff = index - currentIndex;
    if (index == currentIndex + 1) {
      return _moveAnim.value;
    } else if (diff > 0 && diff <= 2) {
      return Offset(0.0, 0.05 * diff);
    } else {
      return const Offset(0.0, 0.0);
    }
  }

  double _getStackedCardScale(int index) {
    int diff = index - currentIndex;
    if (index == currentIndex) {
      return 1.0;
    } else if (index == currentIndex + 1) {
      return _scaleAnim.value;
    } else {
      return (1 - (0.035 * diff.abs()));
    }
  }

  Offset _getFlickTransformOffset(int index) {
    if (index == currentIndex) {
      return _translationAnim.value;
    }
    return const Offset(0.0, 0.0);
  }

  void _horizontalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity! < 0) {
      controller.forward().whenComplete(() {
        setState(() {
          controller.reset();
          currentIndex = (currentIndex + 1) % widget.stackLength;
        });
        widget.onCardChanged(currentIndex);
      });
    }
  }
}
