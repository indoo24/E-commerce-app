import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconBtn extends StatelessWidget {
  VoidCallback? onPressed;
  Color? color;
  Color? bgColor;
  IconData? icon;
  double? iconSize;

  CustomIconBtn(
      {super.key,
      this.onPressed,
      required this.color,
      required this.icon,
      required this.iconSize,
      this.bgColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
      ),
      style: IconButton.styleFrom(
        backgroundColor: bgColor,
        iconSize: iconSize,
        minimumSize: Size(16.w, 16.h),
      ),
    );
  }
}
