import 'package:ecommerce_app/domain/entities/CategoryOrBrandResponseEnitity.dart';
import 'package:ecommerce_app/domain/failuers.dart';

abstract class HomeTabViewModelState {}

class HomeTabViewModelInitial extends HomeTabViewModelState {}

class HomeCategoryLoadingState extends HomeTabViewModelState {}

class HomeCategoryErrorState extends HomeTabViewModelState {
  final Failure failure;

  HomeCategoryErrorState(this.failure);
}

class HomeCategorySuccessState extends HomeTabViewModelState {
  CategoryOrBrandResponseEnitity responseEnitity;

  HomeCategorySuccessState(this.responseEnitity);
}

class HomeBrandLoadingState extends HomeTabViewModelState {}

class HomeBrandErrorState extends HomeTabViewModelState {
  final Failure failure;

  HomeBrandErrorState(this.failure);
}

class HomeBrandSuccessState extends HomeTabViewModelState {
  CategoryOrBrandResponseEnitity responseEnitity;

  HomeBrandSuccessState(this.responseEnitity);
}
