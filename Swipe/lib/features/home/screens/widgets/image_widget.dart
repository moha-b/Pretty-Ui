import 'package:flutter/cupertino.dart';

class ImageWidget extends StatelessWidget {
  final String img;
  const ImageWidget(
    this.img, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
