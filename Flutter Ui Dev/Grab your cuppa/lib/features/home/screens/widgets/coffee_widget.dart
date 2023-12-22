import 'package:flutter/material.dart';

import '../../data/coffee_item.dart';

class CoffeeWidget extends StatefulWidget {
  CoffeeWidget({super.key, required this.index, required this.callback});
  late int index;
  final Function(bool) callback;

  @override
  State<CoffeeWidget> createState() => _CoffeeWidgetState();
}

class _CoffeeWidgetState extends State<CoffeeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset(0.0, 0),
      end: Offset(0.0, 1.6),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
    widget.callback(_isExpanded);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: _animation.value * MediaQuery.of(context).size.height * 0.27,
          child: GestureDetector(
            onTap: _toggleExpansion,
            child: SizedBox(
              height: 200,
              child: Hero(
                tag: items[widget.index].name,
                child: Image.asset(
                  items[widget.index].image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
