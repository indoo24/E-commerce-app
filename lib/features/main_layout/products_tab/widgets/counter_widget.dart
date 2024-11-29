import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_mananger.dart';

class CounterWidget extends StatelessWidget {
  final int initialValue;
  double? widthSize;
  double? heightSize;
  double? fontSize;
  double? iconSize;
  int? count;
  VoidCallback? increment;
  VoidCallback? decrement;

  CounterWidget({
    Key? key,
    this.initialValue = 1,
    this.widthSize,
    this.heightSize,
    this.fontSize,
    this.iconSize,
    this.count,
    this.decrement,
    this.increment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize ?? 40.h,
      width: widthSize ?? 120.w,
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(20.0.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: decrement,
            icon: Icon(Icons.remove, color: Colors.white, size: iconSize ?? 24),
          ),
          Text(
            '$count',
            style: TextStyle(fontSize: fontSize ?? 18, color: Colors.white),
          ),
          IconButton(
            onPressed: increment,
            icon: Icon(Icons.add, color: Colors.white, size: iconSize ?? 24),
          ),
        ],
      ),
    );
  }
}
