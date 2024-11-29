import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/core/widgets/short_text_utils.dart';
import 'package:ecommerce_app/features/main_layout/products_tab/cubit/product_view_model.dart';
import 'package:ecommerce_app/features/main_layout/products_tab/widgets/attribute_widget.dart';
import 'package:ecommerce_app/features/main_layout/products_tab/widgets/cutsom_title_and_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../core/resources/color_mananger.dart';
import '../../../core/resources/constants_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../domain/entities/product_response_entity.dart';

class ProductDetials extends StatelessWidget {
  final ProductEntity productEntity;

  ProductDetials({Key? key, required this.productEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductViewModel, ProductState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Product Details'),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: ColorManager.primary),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart,
                      color: ColorManager.primary),
                  onPressed: () {},
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: ColorManager.primary),
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            productEntity.imageCover ?? AppConstants.imageUrl,
                        fit: BoxFit.cover,
                        height: 300,
                        width: double.infinity,
                        placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                          color: ColorManager.primary,
                        )),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s16.h,
                    ),
                    CutsomTitleAndPrice(
                        title: ShortTextUtils.truncateText(
                            productEntity.title!, 30),
                        price: '${productEntity.price!}'),
                    SizedBox(
                      height: AppSize.s16.h,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AttributeWidget(
                            title: 'Sold: ${productEntity.sold}',
                            width: 120,
                            color: ColorManager.primary,
                          ),
                          SizedBox(
                            width: AppSize.s8.w,
                          ),
                          AttributeWidget(
                            title: 'Rates: ${productEntity.ratingsAverage}',
                            icon: Icons.star,
                            width: 120,
                            color: Colors.transparent,
                          ),
                        ]),
                    SizedBox(
                      height: AppSize.s16.h,
                    ),
                    Text(
                      'Description',
                      style: getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSizeManager.s20.sp),
                    ),
                    SizedBox(
                      height: AppSize.s8.h,
                    ),
                    ReadMoreText(
                      productEntity.description!,
                      trimLines: 2,
                      trimExpandedText: 'Read more',
                      trimCollapsedText: 'Read less',
                      style: getMediumStyle(
                          color: ColorManager.black,
                          fontSize: FontSizeManager.s18.sp),
                    ),
                    const Spacer(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Price',
                                style: getMediumStyle(
                                    color:
                                        ColorManager.primary.withOpacity(0.5),
                                    fontSize: FontSizeManager.s18),
                              ),
                              Text(
                                '${productEntity.price!} EGP',
                                style: getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSizeManager.s18),
                              ),
                            ],
                          ),
                          SpinnerButton(
                            width: 310.w,
                            actionText: AppConstants.addedToCart,
                            textName: AppConstants.addToCart,
                            textColor: ColorManager.white,
                            buttonColor: ColorManager.primary,
                            isLoading: state is AddToCartLoadingState,
                            isSuccess: state is AddToCartSuccessState,
                            onPressed: () {
                              ProductViewModel.get(context)
                                  .addToCart(productEntity.id!);
                            },
                          )
                        ]),
                  ]),
            ));
      },
    );
  }
}
