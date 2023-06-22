import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources/dimn.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.icon,
  });
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimns.small),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimns.small),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(-1, 1),
            blurRadius: 3,
          ),
        ],
        color: Colors.white,
      ),
      child: SvgPicture.asset(
          height: MediaQuery.of(context).size.height * 0.03,
          icon,
          fit: BoxFit.cover),
    );
  }
}
