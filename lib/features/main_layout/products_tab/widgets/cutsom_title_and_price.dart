import 'package:flutter/material.dart';

import '../../../../core/resources/color_mananger.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class CutsomTitleAndPrice extends StatelessWidget {
  String title;
  String price;

  CutsomTitleAndPrice({Key? key, required this.title, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: getBoldStyle(
            color: ColorManager.black, fontSize: FontSizeManager.s20),
      ),
      Text(
        '  \u{00A3} $price',
        style: getBoldStyle(
            color: ColorManager.black, fontSize: FontSizeManager.s20),
      ),
    ]);
  }
}
