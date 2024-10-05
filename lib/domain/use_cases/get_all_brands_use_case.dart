import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/CategoryOrBrandResponseEnitity.dart';
import '../failuers.dart';

@injectable
class GetAllBrandsUseCase {
  HomeRepository homeRepository;

  GetAllBrandsUseCase({required this.homeRepository});

  Future<Either<Failure, CategoryOrBrandResponseEnitity>> invoke() {
    return homeRepository.getAllBrands();
  }
}
