import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/domain/entities/CategoryOrBrandResponseEnitity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_mananger.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class CustomCategoryWidget extends StatelessWidget {
  CategoryOrBrandEntity list;

  CustomCategoryWidget({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(200.r),
          child: CachedNetworkImage(
            imageUrl: list.image ?? AppConstants.imageUrl,
            width: 100.w,
            height: 100.h,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(
              color: ColorManager.primary,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(
          height: AppSize.s8.h,
        ),
        Text(
          list.name ?? '',
          style: getBoldStyle(
              fontSize: FontSizeManager.s16, color: ColorManager.primary),
        ),
      ],
    );
  }
}
