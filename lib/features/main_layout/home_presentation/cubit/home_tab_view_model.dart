import 'package:ecommerce_app/domain/entities/CategoryOrBrandResponseEnitity.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_categories_use_case.dart';
import 'package:ecommerce_app/features/main_layout/home_presentation/cubit/home_tab_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModelCubit extends Cubit<HomeTabViewModelState> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabViewModelCubit(
      {required this.getAllCategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(HomeTabViewModelInitial());

  List<CategoryOrBrandEntity> categoryList = [];
  List<CategoryOrBrandEntity> brandsList = [];

  Future<void> getAllCategories() async {
    emit(HomeCategoryLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold((failure) {
      emit(HomeCategoryErrorState(failure));
    }, (categoryResponseEnitity) {
      categoryList = categoryResponseEnitity.data! ?? [];
      if (categoryList.isNotEmpty) {
        emit(HomeCategorySuccessState(categoryResponseEnitity));
      }
    });
  }

  Future<void> getAllBrands() async {
    emit(HomeBrandLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold((failure) {
      emit(HomeBrandErrorState(failure));
    }, (brandResponseEnitity) {
      brandsList = brandResponseEnitity.data! ?? [];
      if (brandsList.isNotEmpty) {
        emit(HomeBrandSuccessState(brandResponseEnitity));
      }
    });
  }
}
