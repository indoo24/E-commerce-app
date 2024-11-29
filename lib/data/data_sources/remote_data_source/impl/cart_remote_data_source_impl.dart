import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_manager.dart';

import 'package:ecommerce_app/domain/failuers.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/widgets/shared_pref_utils.dart';
import '../../../end_pointes.dart';
import '../../../model/GetCartResponseDto.dart';
import '../cart_remote_data_source.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManger apiManger;

  CartRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<Either<Failure, GetCartResponseDto>> getCart() async {
    try {
      ConnectivityResult checkResult = ConnectivityResult.wifi;
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = SharedPrefUtils.getDate(key: 'token');
        var response = await apiManger
            .getData(EndPoints.cart, headers: {'token': token.toString()});
        var addToCartResponse = GetCartResponseDto.fromJson(response.data);
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
  Future<Either<Failure, GetCartResponseDto>> deleteItemInCart(
      String productId) async {
    try {
      ConnectivityResult checkResult = ConnectivityResult.wifi;
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = SharedPrefUtils.getDate(key: 'token');
        var response = await apiManger.deleteData(
            '${EndPoints.cart}/$productId',
            headers: {'token': token.toString()});
        var deleteItemInCartResponse =
            GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(deleteItemInCartResponse);
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
  Future<Either<Failure, GetCartResponseDto>> updateCountInCart(
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
}
