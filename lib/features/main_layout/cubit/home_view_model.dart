import 'package:ecommerce_app/features/main_layout/cubit/home_state.dart';
import 'package:ecommerce_app/features/main_layout/favourit_presentation/favourite_screen.dart';
import 'package:ecommerce_app/features/main_layout/home_presentation/home_tab.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/profile_tab.dart';
import 'package:ecommerce_app/features/product_screen%20presentation/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(HomeInitialeState());

  int currentIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    ProductsScreen(),
    FavouriteScreen(),
    ProfileTab(),
  ];

  void changeSelectedIndex(int selectedIndex) {
    emit(HomeInitialeState());
    currentIndex = selectedIndex;
    emit(SelectedIndexState());
  }
}
