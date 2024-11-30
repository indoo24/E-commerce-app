import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/products_tab/cubit/product_view_model.dart';
import 'package:ecommerce_app/features/main_layout/products_tab/product_detials.dart';
import 'package:ecommerce_app/features/main_layout/products_tab/widgets/custom_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/widgets/toast_utils.dart';

class ProductTab extends StatelessWidget {
  const ProductTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductViewModel, ProductState>(
      bloc: ProductViewModel.get(context)..getAllProducts(),
      listener: (context, state) {
        if (state is AddToWishlistSuccessState) {
          ToastUtils.showSuccessToast(
              AppConstants.success, context, AppConstants.addToWishList);
        } else if (state is AddToWishlistErrorState) {
          ToastUtils.showErrorToast(
              AppConstants.error, context, AppConstants.somethingWentWrong);
        }
        if (state is AddToCartSuccessState) {
          ToastUtils.showSuccessToast(
              AppConstants.success, context, AppConstants.addToCartList);
        } else if (state is AddToCartErrorState) {
          ToastUtils.showErrorToast(
              AppConstants.error, context, AppConstants.somethingWentWrong);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: ProductViewModel.get(context).productList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 290,
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetials(
                                                productEntity:
                                                    ProductViewModel.get(
                                                            context)
                                                        .productList[index],
                                              )));
                                },
                                child: CustomProductItem(
                                  product: ProductViewModel.get(context)
                                      .productList[index],
                                )),
                            itemCount: ProductViewModel.get(context)
                                .productList
                                .length),
                      ),
                    ],
                  ),
                )
                : Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 290,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetials(
                                                    productEntity:
                                                        ProductViewModel.get(
                                                                context)
                                                            .productList[index],
                                                  )));
                                    },
                                    child: CustomProductItem(
                                      product: ProductViewModel.get(context)
                                          .productList[index],
                                    )),
                                itemCount: ProductViewModel.get(context)
                                    .productList
                                    .length),
                          ),
                        ],
                      ),
                    )));
      },
    );
  }
}
