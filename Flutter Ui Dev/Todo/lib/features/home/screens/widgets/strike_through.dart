import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StrikeThrough extends StatelessWidget {
  bool todoToggle;
  String todoText;
  StrikeThrough({super.key, required this.todoToggle, required this.todoText});

  Widget _strikewidget() {
    if (todoToggle == false) {
      return Text(todoText, style: TextStyle(color: Colors.grey.shade700));
    } else {
      return Text(
        todoText,
        style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.grey.shade700,
            fontStyle: FontStyle.italic),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _strikewidget();
  }
}
