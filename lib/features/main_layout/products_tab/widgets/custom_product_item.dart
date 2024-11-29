import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/widgets/short_text_utils.dart';
import 'package:ecommerce_app/domain/entities/product_response_entity.dart';
import 'package:ecommerce_app/features/main_layout/products_tab/widgets/custom_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_mananger.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../cubit/product_view_model.dart';

class CustomProductItem extends StatelessWidget {
  ProductEntity product;

  CustomProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.primary),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                height: 125.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: CachedNetworkImage(
                  imageUrl: product.imageCover ?? AppConstants.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  )),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Positioned(
                  top: 4.h,
                  right: 4.w,
                  child: CustomIconBtn(
                      color: ColorManager.primary,
                      bgColor: ColorManager.white,
                      icon: Icons.favorite_border,
                      iconSize: 16,
                      onPressed: () {
                        ProductViewModel.get(context)
                            .addToWishList(product.id!);
                      })),
            ],
          ),
          SizedBox(
            height: AppSize.s8.h,
          ),
          Text(
            ShortTextUtils.truncateText(product.title ?? 'Product', 20),
            style: getBoldStyle(
                color: ColorManager.black, fontSize: FontSizeManager.s16.sp),
          ),
          Text(
            ShortTextUtils.truncateDescription(
                product.description ?? 'Product', 30),
            style: getMediumStyle(
                color: ColorManager.black, fontSize: FontSizeManager.s14.sp),
          ),
          Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${product.price} EGP',
                  style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSizeManager.s16.sp),
                ),
                CustomIconBtn(
                  iconSize: 16.h,
                  color: ColorManager.white,
                  bgColor: ColorManager.primary,
                  icon: Icons.add,
                  onPressed: () {
                    ProductViewModel.get(context).addToCart(product.id!);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
