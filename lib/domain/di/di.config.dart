// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_manager.dart' as _i236;
import '../../data/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i45;
import '../../data/data_sources/remote_data_source/cart_remote_data_source.dart'
    as _i398;
import '../../data/data_sources/remote_data_source/home_remote_data_source.dart'
    as _i579;
import '../../data/data_sources/remote_data_source/impl/auth_remote_data_source_impl.dart'
    as _i1060;
import '../../data/data_sources/remote_data_source/impl/cart_remote_data_source_impl.dart'
    as _i872;
import '../../data/data_sources/remote_data_source/impl/home_remote_data_source_impl.dart'
    as _i354;
import '../../data/data_sources/remote_data_source/impl/wish_list_remote_data_source_impl.dart'
    as _i190;
import '../../data/data_sources/remote_data_source/wish_list_remote_data_source.dart'
    as _i566;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../data/repository/cart_repository_impl.dart' as _i942;
import '../../data/repository/home_repository_impl.dart' as _i1043;
import '../../data/repository/wish_list_repository_impl.dart' as _i194;
import '../../features/auth/login/cubit/login_view_model_cubit.dart' as _i726;
import '../../features/auth/register/cubit/register_view_model_cubit.dart'
    as _i584;
import '../../features/auth_presentation/login/cubit/login_view_model.dart'
    as _i656;
import '../../features/auth_presentation/regester/cubit/register_view_model_cubit.dart'
    as _i422;
import '../../features/cart/cubit/cart_view_model_cubit.dart' as _i261;
import '../../features/main_layout/favourite_tab/cubit/wishlist_cubit.dart'
    as _i954;
import '../../features/main_layout/home_presentation/cubit/home_tab_view_model.dart'
    as _i796;
import '../../features/main_layout/home_tab/cubit/home_tab_view_model_cubit.dart'
    as _i913;
import '../../features/main_layout/products_tab/cubit/product_view_model.dart'
    as _i559;
import '../repository/auth_repository.dart' as _i106;
import '../repository/cart_repository.dart' as _i900;
import '../repository/home_repository.dart' as _i326;
import '../repository/wish_list_repository.dart' as _i29;
import '../use_cases/add_to_cart_use_case.dart' as _i661;
import '../use_cases/add_to_wish_list_use_case.dart' as _i934;
import '../use_cases/delete_from_wish_list_use_case.dart' as _i237;
import '../use_cases/delete_item_cart_use_case.dart' as _i574;
import '../use_cases/get_all_brands_use_case.dart' as _i59;
import '../use_cases/get_all_categories_use_case.dart' as _i924;
import '../use_cases/get_all_product_use_case.dart' as _i382;
import '../use_cases/get_cart_use_case.dart' as _i220;
import '../use_cases/get_wish_list_use_case.dart' as _i136;
import '../use_cases/login_use_case.dart' as _i119;
import '../use_cases/register_use_case.dart' as _i526;
import '../use_cases/update_count_cart_use_case.dart' as _i189;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i236.ApiManger>(() => _i236.ApiManger());
    gh.factory<_i45.AuthRemoteDataSource>(() =>
        _i1060.AuthRemoteDataSourceImpl(apiManger: gh<_i236.ApiManger>()));
    gh.factory<_i106.AuthRepository>(() => _i581.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i45.AuthRemoteDataSource>()));
    gh.factory<_i398.CartRemoteDataSource>(
        () => _i872.CartRemoteDataSourceImpl(apiManger: gh<_i236.ApiManger>()));
    gh.factory<_i579.HomeRemoteDataSource>(
        () => _i354.HomeRemoteDataSourceImpl(apiManger: gh<_i236.ApiManger>()));
    gh.factory<_i566.WishListRemoteDataSource>(() =>
        _i190.WishListRemoteDataSourceImpl(apiManger: gh<_i236.ApiManger>()));
    gh.factory<_i119.LoginUseCase>(
        () => _i119.LoginUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i526.RegisterUseCase>(() =>
        _i526.RegisterUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i726.LoginViewModelCubit>(() =>
        _i726.LoginViewModelCubit(loginUseCase: gh<_i119.LoginUseCase>()));
    gh.factory<_i656.LoginViewModel>(
        () => _i656.LoginViewModel(loginUseCase: gh<_i119.LoginUseCase>()));
    gh.factory<_i900.CartRepository>(() => _i942.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i398.CartRemoteDataSource>()));
    gh.factory<_i574.DeleteItemInCartUseCase>(() =>
        _i574.DeleteItemInCartUseCase(
            cartRepository: gh<_i900.CartRepository>()));
    gh.factory<_i220.GetCartUseCase>(
        () => _i220.GetCartUseCase(cartRepository: gh<_i900.CartRepository>()));
    gh.factory<_i189.UpdateCountInCartUseCase>(() =>
        _i189.UpdateCountInCartUseCase(
            cartRepository: gh<_i900.CartRepository>()));
    gh.factory<_i326.HomeRepository>(() => _i1043.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i579.HomeRemoteDataSource>()));
    gh.factory<_i29.WishListRepository>(() => _i194.WishListRepositoryImpl(
        wishListRemoteDataSource: gh<_i566.WishListRemoteDataSource>()));
    gh.factory<_i661.AddToCartUseCase>(() =>
        _i661.AddToCartUseCase(homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i59.GetAllBrandsUseCase>(() =>
        _i59.GetAllBrandsUseCase(homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i924.GetAllCategoriesUseCase>(() =>
        _i924.GetAllCategoriesUseCase(
            homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i382.GetAllProductUseCase>(() =>
        _i382.GetAllProductUseCase(homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i934.AddToWishListUseCase>(
        () => _i934.AddToWishListUseCase(gh<_i29.WishListRepository>()));
    gh.factory<_i237.DeleteFromWishListUseCase>(
        () => _i237.DeleteFromWishListUseCase(gh<_i29.WishListRepository>()));
    gh.factory<_i136.GetWishListUseCase>(
        () => _i136.GetWishListUseCase(gh<_i29.WishListRepository>()));
    gh.factory<_i584.RegisterViewModelCubit>(() => _i584.RegisterViewModelCubit(
        registerUseCase: gh<_i526.RegisterUseCase>()));
    gh.factory<_i422.RegisterViewModelCubit>(() => _i422.RegisterViewModelCubit(
        registerUseCase: gh<_i526.RegisterUseCase>()));
    gh.factory<_i796.HomeTabViewModelCubit>(() => _i796.HomeTabViewModelCubit(
          getAllCategoriesUseCase: gh<_i924.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i59.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i913.HomeTabViewModelCubit>(() => _i913.HomeTabViewModelCubit(
          getAllCategoriesUseCase: gh<_i924.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i59.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i261.CartViewModelCubit>(() => _i261.CartViewModelCubit(
          getCartUseCase: gh<_i220.GetCartUseCase>(),
          deleteItemUseCase: gh<_i574.DeleteItemInCartUseCase>(),
          updateCountInCartUseCase: gh<_i189.UpdateCountInCartUseCase>(),
        ));
    gh.factory<_i954.WishlistCubit>(() => _i954.WishlistCubit(
          getWishListUseCase: gh<_i136.GetWishListUseCase>(),
          addToWishListUseCase: gh<_i934.AddToWishListUseCase>(),
          deleteFromWishListUseCase: gh<_i237.DeleteFromWishListUseCase>(),
        ));
    gh.factory<_i559.ProductViewModel>(() => _i559.ProductViewModel(
          gh<_i382.GetAllProductUseCase>(),
          gh<_i661.AddToCartUseCase>(),
          gh<_i189.UpdateCountInCartUseCase>(),
          gh<_i934.AddToWishListUseCase>(),
        ));
    return this;
  }
}
