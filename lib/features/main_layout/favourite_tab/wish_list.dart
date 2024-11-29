import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/favourite_tab/cubit/wishlist_cubit.dart';
import 'package:ecommerce_app/features/main_layout/favourite_tab/widgets/wish_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_mananger.dart';
import '../../../core/widgets/not_have_items.dart';
import '../../../core/widgets/toast_utils.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<WishlistCubit, WishlistState>(
      listener: (context, state) {
        if (state is DeleteFromWishlistSuccessState) {
          ToastUtils.showSuccessToast(
              AppConstants.success, context, AppConstants.deleteFromWishList);
        } else if (state is DeleteFromWishlistErrorState) {
          ToastUtils.showErrorToast(
              AppConstants.error, context, AppConstants.somethingWentWrong);
        }
      },
      bloc: WishlistCubit.get(context)..getWishList(),
      builder: (context, state) {
        if (WishlistCubit.get(context).productList.isEmpty) {
          return NotHaveItems(
            icon: Icons.favorite_border_outlined,
            message: AppConstants.yourWishListIsEmpty,
          );
        } else if (state is WishlistSuccessState ||
            state is DeleteFromWishlistSuccessState) {
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                  shrinkWrap: true,
                  itemCount: WishlistCubit.get(context).productList.length,
                  itemBuilder: (context, index) {
                    return WishListItemCard(
                      index: index,
                    );
                  },
                ),
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
