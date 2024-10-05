import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/CategoryOrBrandResponseEnitity.dart';
import 'package:ecommerce_app/domain/failuers.dart';

import '../entities/GetCartResponseEntity.dart';
import '../entities/GetWichlistResponseEntity.dart';
import '../entities/product_response_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, CategoryOrBrandResponseEnitity>> getAllCategories();

  Future<Either<Failure, CategoryOrBrandResponseEnitity>> getAllBrands();

  Future<Either<Failure, ProductResponseEntity>> getAllProduct();

  Future<Either<Failure, AddToCartResponseEntity>> addToCart(String productId);

  Future<Either<Failure, GetCartResponseEntity>>
      updateNumOfCartInProductDetails(String productId, int count);

  Future<Either<Failure, GetWishListResponseEntity>> addToWishList(
      {required String productId});
}
