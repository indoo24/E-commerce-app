import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/LoginResponseEntity.dart';

import '../../../domain/entities/RegisterResponseEntity.dart';
import '../../../domain/failuers.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<Failure, LoginResponseEntity>> login(
    String email,
    String password,
  );
}
