import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:helia/core/resources/colors.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 200) {
      firstHalf = widget.text.substring(0, 280);
      secondHalf = widget.text.substring(280, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text.rich(
        TextSpan(
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(text: isExpanded ? widget.text : firstHalf),
            if (!isExpanded) ...[
              TextSpan(text: '...'),
              TextSpan(
                text: 'Read more',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      isExpanded = true;
                    });
                  },
              ),
            ],
            if (isExpanded && secondHalf.isNotEmpty) ...[
              TextSpan(text: secondHalf),
              TextSpan(
                text: 'Read less',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      isExpanded = false;
                    });
                  },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
