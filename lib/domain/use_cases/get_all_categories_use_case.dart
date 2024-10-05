import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/CategoryOrBrandResponseEnitity.dart';
import '../failuers.dart';

@injectable
class GetAllCategoriesUseCase {
  HomeRepository homeRepository;

  GetAllCategoriesUseCase({required this.homeRepository});

  Future<Either<Failure, CategoryOrBrandResponseEnitity>> invoke() {
    return homeRepository.getAllCategories();
  }
}
