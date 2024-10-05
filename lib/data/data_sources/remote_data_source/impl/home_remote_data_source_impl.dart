import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/widgets/shared_pref_utils.dart';
import 'package:ecommerce_app/data/api_manager.dart';
import 'package:ecommerce_app/data/model/AddToCartResponseDto.dart';
import 'package:ecommerce_app/data/model/CategoryOrBrandResponseDto.dart';
import 'package:ecommerce_app/data/model/ProductResponseDto.dart';
import 'package:ecommerce_app/domain/entities/CategoryOrBrandResponseEnitity.dart';
import 'package:ecommerce_app/domain/entities/product_response_entity.dart';
import 'package:ecommerce_app/domain/failuers.dart';
import 'package:injectable/injectable.dart';

import '../../../end_pointes.dart';
import '../../../model/GetCartResponseDto.dart';
import '../../../model/GetWishListResponseDto.dart';
import '../home_remote_data_source.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManger apiManger;

  HomeRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<Either<Failure, CategoryOrBrandResponseDto>> getAllCategories() async {
    try {
      ConnectivityResult checkResult = ConnectivityResult.wifi;
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManger.getData(EndPoints.categories);
        var getAllCategoryResponse =
            CategoryOrBrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllCategoryResponse);
        } else {
          return Left(ServerError(errorMessage: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoryOrBrandResponseEnitity>> getAllBrands() async {
    try {
      ConnectivityResult checkResult = ConnectivityResult.wifi;
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManger.getData(EndPoints.brands);
        var getAllBrandResponse =
            CategoryOrBrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllBrandResponse);
        } else {
          return Left(ServerError(errorMessage: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductResponseEntity>> getAllProduct() async {
    try {
      ConnectivityResult checkResult = ConnectivityResult.wifi;
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManger.getData(EndPoints.product);
        var getAllProductResponse = ProductResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllProductResponse);
        } else {
          return Left(ServerError(errorMessage: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddToCartResponseDto>> addToCart(
      String productId) async {
    try {
      ConnectivityResult checkResult = ConnectivityResult.wifi;
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = SharedPrefUtils.getDate(key: 'token');
        var response = await apiManger.postData(EndPoints.cart,
            body: {"productId": productId},
            headers: {'token': token.toString()});
        var addToCartResponse = AddToCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addToCartResponse);
        } else {
          return Left(ServerError(errorMessage: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetCartResponseDto>> updateNumOfCartInProductDetails(
      String productId, int count) async {
    try {
      ConnectivityResult checkResult = ConnectivityResult.wifi;
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = SharedPrefUtils.getDate(key: 'token');
        var response = await apiManger.updateData(
            '${EndPoints.cart}/$productId',
            body: {'count': '$count'},
            headers: {'token': token.toString()});
        var updateCountInCartResponse =
            GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(updateCountInCartResponse);
        } else {
          return Left(ServerError(errorMessage: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetWishListResponseDto>> addToWishList(
      {required String productId}) async {
    try {
      ConnectivityResult checkResult = ConnectivityResult.wifi;
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = SharedPrefUtils.getDate(key: 'token');
        var response = await apiManger.postData(EndPoints.wishlist,
            body: {"productId": productId},
            headers: {'token': token.toString()});
        var addToWishListResponse =
            GetWishListResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addToWishListResponse);
        } else {
          return Left(ServerError(errorMessage: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
