import 'package:ecommerce_app/core/widgets/short_text_utils.dart';
import 'package:ecommerce_app/features/main_layout/favourite_tab/cubit/wishlist_cubit.dart';
import 'package:ecommerce_app/features/main_layout/products_tab/widgets/custom_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_mananger.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class WishListItemCard extends StatelessWidget {
  final int index;

  WishListItemCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Container(
          height: 125.h,
          width: double.infinity.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: ColorManager.primary, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 125.h,
                width: 120.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: ColorManager.primary, width: 1),
                ),
                child: Image.network(
                  WishlistCubit.get(context).productList[index].imageCover ??
                      AppConstants.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ShortTextUtils.truncateText(
                              WishlistCubit.get(context)
                                  .productList[index]
                                  .title!,
                              25),
                          style: getBoldStyle(
                              color: ColorManager.darkPrimary,
                              fontSize: FontSizeManager.s16.sp),
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.clip,
                        ),
                        CustomIconBtn(
                          color: ColorManager.darkPrimary,
                          icon: Icons.delete_outline,
                          iconSize: 24.sp,
                          onPressed: () {
                            WishlistCubit.get(context).deleteFromWishList(
                                WishlistCubit.get(context)
                                    .productList[index]
                                    .id!);
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${WishlistCubit.get(context).productList[index].price} EGP',
                          style: getBoldStyle(
                              color: ColorManager.darkPrimary,
                              fontSize: FontSizeManager.s16.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
