import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_mananger.dart';
import 'package:ecommerce_app/features/main_layout/cubit/home_state.dart';
import 'package:ecommerce_app/features/main_layout/cubit/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatefulWidget {
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
            extendBody: false,
            body: viewModel.tabs[viewModel.currentIndex],
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: BottomNavigationBar(
                  currentIndex: viewModel.currentIndex,
                  onTap: (value) => viewModel.changeSelectedIndex(value),
                  backgroundColor: ColorManager.primary,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: ColorManager.primary,
                  unselectedItemColor: ColorManager.white,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: const [
                    BottomNavigationBarItem(
                        icon: ImageIcon(AssetImage(IconAssets.icHome)),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: ImageIcon(AssetImage(IconAssets.icCategories)),
                        label: 'Category'),
                    BottomNavigationBarItem(
                        icon: ImageIcon(AssetImage(IconAssets.icHeart)),
                        label: 'Watchlist'),
                    BottomNavigationBarItem(
                        icon: ImageIcon(AssetImage(IconAssets.icUser)),
                        label: 'Profile'),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
