import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../favourite_tab/wish_list.dart';
import '../home_tab/home_tab.dart';
import '../products_tab/product_tab.dart';
import '../profile_tab/profile_tab.dart';

part 'main_layout_state.dart';

class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel() : super(HomeInitial());

  int currentIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    ProductTab(),
    WishList(),
    ProfileTab(),
  ];

  void changeIndex(int index) {
    emit(HomeInitial());
    currentIndex = index;
    emit(ChangeSelectedIndexState());
  }
}
