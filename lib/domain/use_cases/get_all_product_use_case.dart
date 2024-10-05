import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/product_response_entity.dart';
import 'package:ecommerce_app/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../failuers.dart';

@injectable
class GetAllProductUseCase {
  HomeRepository homeRepository;

  GetAllProductUseCase({required this.homeRepository});

  Future<Either<Failure, ProductResponseEntity>> invoke() {
    return homeRepository.getAllProduct();
  }
}
