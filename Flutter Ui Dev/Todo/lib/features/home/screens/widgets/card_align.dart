import 'package:flutter/material.dart';
import 'card_widget.dart';

// ignore: must_be_immutable
class CenteredCard extends StatelessWidget {
  int currentpagenumber;
 

  CenteredCard({
    super.key,
    required this.currentpagenumber,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 300, right: 5, left: 5),
          child: cardWidget(context, currentpagenumber ),
        ),
      ],
    );
  }
}
