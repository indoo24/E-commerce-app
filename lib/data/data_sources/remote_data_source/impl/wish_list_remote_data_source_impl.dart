import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_manager.dart';
import 'package:ecommerce_app/data/model/GetWishListResponseDto.dart';
import 'package:ecommerce_app/domain/failuers.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/widgets/shared_pref_utils.dart';
import '../../../end_pointes.dart';
import '../wish_list_remote_data_source.dart';

@Injectable(as: WishListRemoteDataSource)
class WishListRemoteDataSourceImpl implements WishListRemoteDataSource {
  ApiManger apiManger;

  WishListRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<Either<Failure, GetWishListResponseDto>> getWishList() async {
    try {
      ConnectivityResult checkResult = ConnectivityResult.wifi;
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = SharedPrefUtils.getDate(key: 'token');
        var response = await apiManger
            .getData(EndPoints.wishlist, headers: {'token': token.toString()});
        var getWishListResponse =
            GetWishListResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getWishListResponse);
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
  Future<Either<Failure, String>> addToWishList(
      {required String productId}) async {
    try {
      ConnectivityResult checkResult = ConnectivityResult.wifi;
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = SharedPrefUtils.getDate(key: 'token');
        var response = await apiManger.postData(EndPoints.wishlist,
            body: {'productId': productId},
            headers: {'token': token.toString()});
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(response.data['message']);
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
  Future<Either<Failure, String>> deleteProductFromWishList(
      {required String productId}) async {
    try {
      ConnectivityResult checkResult = ConnectivityResult.wifi;
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = SharedPrefUtils.getDate(key: 'token');
        var response = await apiManger.deleteData(
            '${EndPoints.wishlist}/$productId',
            headers: {'token': token.toString()});
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(response.data['message']);
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
