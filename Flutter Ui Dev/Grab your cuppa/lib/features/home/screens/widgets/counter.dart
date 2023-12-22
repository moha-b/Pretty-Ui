import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  final bool isExpanded;
  final int count;
  const AnimatedCounter(
      {super.key, required this.count, required this.isExpanded});

  @override
  _AnimatedCounterState createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              splashColor: Colors.transparent,
              splashRadius: 1,
              icon: const Icon(Icons.remove),
              onPressed: () {},
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation.value,
                  child: Text(
                    widget.count.toString().padLeft(2, '0'),
                    style: const TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                );
              },
            ),
            IconButton(
              splashRadius: 1,
              splashColor: Colors.transparent,
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
