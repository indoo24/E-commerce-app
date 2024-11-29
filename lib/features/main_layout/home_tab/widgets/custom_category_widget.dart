import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/domain/entities/CategoryOrBrandResponseEnitity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_mananger.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../domain/entities/product_response_entity.dart';
import '../../products_tab/cubit/product_view_model.dart';
import '../../products_tab/product_detials.dart';

class CustomCategoryWidget extends StatelessWidget {
  CategoryOrBrandEntity list;
  ProductEntity product;

  CustomCategoryWidget({Key? key, required this.list, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.productDetailsRoute, arguments: list.id);
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(150.r),
            child: CachedNetworkImage(
              imageUrl: list.image ?? AppConstants.imageUrl,
              width: 80.w,
              height: 80.h,
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
            maxLines: 1,
            style: getBoldStyle(
                fontSize: FontSizeManager.s16, color: ColorManager.primary),
          ),
        ],
      ),
    );
  }
}
