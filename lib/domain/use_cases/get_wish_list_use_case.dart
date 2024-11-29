import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repository/wish_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/GetWichlistResponseEntity.dart';
import '../failuers.dart';

@injectable
class GetWishListUseCase {
  WishListRepository wishListRepository;

  GetWishListUseCase(this.wishListRepository);

  Future<Either<Failure, GetWishListResponseEntity>> invoke() async {
    return wishListRepository.getWishList();
  }
}
