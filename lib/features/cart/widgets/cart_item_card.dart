import 'package:ecommerce_app/core/widgets/short_text_utils.dart';
import 'package:ecommerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce_app/features/main_layout/products_tab/widgets/custom_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_mananger.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../cubit/cart_view_model_cubit.dart';

class CartItemCard extends StatelessWidget {
  final GetProductCartEntity cartEntity;

  CartItemCard({Key? key, required this.cartEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Container(
          height: 130.h,
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
                  cartEntity.product!.imageCover!,
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
                              cartEntity.product!.title!, 30),
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
                            CartViewModelCubit.get(context)
                                .deleteItemInCart(cartEntity.product!.id!);
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
                          '${cartEntity.price} EGP',
                          style: getBoldStyle(
                              color: ColorManager.darkPrimary,
                              fontSize: FontSizeManager.s16.sp),
                        ),
                        Container(
                          margin: EdgeInsets.all(8.r),
                          height: 30.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: ColorManager.primary),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    int count = cartEntity.count!.toInt();
                                    count--;
                                    CartViewModelCubit.get(context)
                                        .updateCountInCart(
                                            cartEntity.product!.id!, count);
                                  },
                                  child: Icon(
                                    Icons.remove_circle_outline_rounded,
                                    size: 20.w,
                                    color: ColorManager.white,
                                  )),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                '${cartEntity.count!}',
                                style: getBoldStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSizeManager.s16.sp),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              InkWell(
                                  onTap: () {
                                    int count = cartEntity.count!.toInt();
                                    count++;
                                    CartViewModelCubit.get(context)
                                        .updateCountInCart(
                                            cartEntity.product!.id!, count);
                                  },
                                  child: Icon(
                                    Icons.add_circle_outline_rounded,
                                    size: 20.w,
                                    color: ColorManager.white,
                                  )),
                            ],
                          ),
                        )
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
