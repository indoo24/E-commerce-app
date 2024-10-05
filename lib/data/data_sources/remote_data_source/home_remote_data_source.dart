import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/product_response_entity.dart';

import '../../../domain/entities/AddToCartResponseEntity.dart';
import '../../../domain/entities/CategoryOrBrandResponseEnitity.dart';
import '../../../domain/entities/GetCartResponseEntity.dart';
import '../../../domain/entities/GetWichlistResponseEntity.dart';
import '../../../domain/failuers.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, CategoryOrBrandResponseEnitity>> getAllCategories();

  Future<Either<Failure, CategoryOrBrandResponseEnitity>> getAllBrands();

  Future<Either<Failure, ProductResponseEntity>> getAllProduct();

  Future<Either<Failure, AddToCartResponseEntity>> addToCart(String productId);

  Future<Either<Failure, GetCartResponseEntity>>
      updateNumOfCartInProductDetails(String productId, int count);

  Future<Either<Failure, GetWishListResponseEntity>> addToWishList(
      {required String productId});
}
