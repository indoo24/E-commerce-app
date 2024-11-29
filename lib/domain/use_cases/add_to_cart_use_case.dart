import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:ecommerce_app/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/CategoryOrBrandResponseEnitity.dart';
import '../failuers.dart';

@injectable
class AddToCartUseCase {
  HomeRepository homeRepository;

  AddToCartUseCase({required this.homeRepository});

  Future<Either<Failure, AddToCartResponseEntity>> invoke(String productId) {
    return homeRepository.addToCart(productId);
  }
}
