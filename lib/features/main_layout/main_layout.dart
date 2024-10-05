import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:ecommerce_app/core/resources/color_mananger.dart';
import 'package:ecommerce_app/features/main_layout/cubit/main_layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/values_manager.dart';
import 'home_tab/widgets/custom_appbar.dart';

class MainLayout extends StatelessWidget {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeState>(
      bloc: homeViewModel,
      builder: (context, state) {
        return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(AppSize.s96.h),
                child: const CustomAppbar()),
            extendBody: true,
            body: homeViewModel.tabs[homeViewModel.currentIndex],
            bottomNavigationBar: CrystalNavigationBar(
              currentIndex: homeViewModel.currentIndex,
              onTap: homeViewModel.changeIndex,
              backgroundColor: ColorManager.white.withOpacity(0.3),
              selectedItemColor: ColorManager.primary,
              items: [
                /// Home
                CrystalNavigationBarItem(
                  icon: Icons.home,
                  unselectedIcon: Icons.home_outlined,
                  selectedColor: ColorManager.primary,
                ),
                CrystalNavigationBarItem(
                  icon: Icons.category,
                  unselectedIcon: Icons.category_outlined,
                  selectedColor: ColorManager.primary,
                ),
                CrystalNavigationBarItem(
                  icon: Icons.favorite,
                  unselectedIcon: Icons.favorite_outline,
                  selectedColor: ColorManager.primary,
                ),
                CrystalNavigationBarItem(
                  icon: Icons.person,
                  unselectedIcon: Icons.person_outline,
                  selectedColor: ColorManager.primary,
                ),
              ],
            ));
      },
    );
  }
}

