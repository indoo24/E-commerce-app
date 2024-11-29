import 'package:ecommerce_app/features/cart/cubit/cart_view_model_cubit.dart';
import 'package:ecommerce_app/features/cart/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/color_mananger.dart';
import '../../core/resources/constants_manager.dart';
import '../../core/resources/font_manager.dart';
import '../../core/resources/styles_manager.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/not_have_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          centerTitle: true,
        ),
        body: BlocBuilder<CartViewModelCubit, CartViewModelState>(
          bloc: CartViewModelCubit.get(context)..getCart(),
          builder: (context, state) {
            if (CartViewModelCubit.get(context).productList.isEmpty) {
              return NotHaveItems(
                icon: Icons.shopping_cart_rounded,
                message: AppConstants.yourCartIsEmpty,
              );
            } else if (state is GetCartSuccessState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 8.h),
                      shrinkWrap: true,
                      itemCount: state.responseEntity.data!.products!.length,
                      itemBuilder: (context, index) {
                        return CartItemCard(
                          cartEntity:
                              state.responseEntity.data!.products![index],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Row(
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
                                '${state.responseEntity.data!.totalCartPrice!} EGP',
                                style: getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSizeManager.s18),
                              ),
                            ],
                          ),
                          SpinnerButton(
                            onPressed: () {},
                            width: 310.w,
                            actionText: AppConstants.checkoutSuccess,
                            textName: AppConstants.checkout,
                            textColor: ColorManager.white,
                            buttonColor: ColorManager.primary,
                            isLoading: state is GetCartLoadingState,
                            isSuccess: false,
                          )
                        ]),
                  ),
                ],
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: ColorManager.primary,
              ));
            }
          },
        ));
  }
}
