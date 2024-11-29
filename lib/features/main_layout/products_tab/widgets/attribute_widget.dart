import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_mananger.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';

class AttributeWidget extends StatelessWidget {
  String title;
  double? width;

  IconData? icon;
  Color color;

  AttributeWidget(
      {Key? key,
      required this.title,
      this.icon,
      this.width,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width?.w,
        padding: EdgeInsets.all(AppPadding.p8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(color: color),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: getBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSizeManager.s16.sp),
                textAlign: TextAlign.center,
              ),
              if (icon != null) Icon(icon, color: ColorManager.primary),
            ],
          ),
        ));
  }
}
