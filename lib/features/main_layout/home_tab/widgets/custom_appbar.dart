import 'package:ecommerce_app/core/widgets/shared_pref_utils.dart';
import 'package:ecommerce_app/features/main_layout/products_tab/cubit/product_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_mananger.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/routes_manager/routes.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductViewModel, ProductState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
          backgroundColor: ColorManager.primary.withOpacity(0.1),
          title: Image.asset(
            ImageAssets.logo,
            color: ColorManager.primary,
            height: AppSize.s112.h,
            width: AppSize.s112.w,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: AppSize.s96.h,
          leading: IconButton(
            icon: const Icon(
              Icons.search,
              color: ColorManager.primary,
              size: AppSize.s24,
            ),
            onPressed: () {},
          ),
          actions: [
            badges.Badge(
              badgeContent: Text(
                ProductViewModel.get(context).numOfCartItems.toString(),
                style: getBoldStyle(
                    color: ColorManager.white,
                    fontSize: FontSizeManager.s16.sp),
              ),
              position: badges.BadgePosition.topEnd(top: -4, end: 2),
              badgeAnimation: const badges.BadgeAnimation.fade(),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: ColorManager.primary,
                  size: AppSize.s24,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.cartRoute);
                },
              ),
            ),
            SizedBox(width: AppSize.s8.w),
            IconButton(
              icon: const Icon(
                Icons.exit_to_app,
                color: ColorManager.primary,
                size: AppSize.s24,
              ),
              onPressed: () {
                Navigator.pop(context);
                SharedPrefUtils.removeData(key: 'token');
              },
            ),
            SizedBox(width: AppSize.s8.w),
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(AppSize.s24.r),
          )),
        ));
      },
    );
  }
}
