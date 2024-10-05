import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/LoginResponsEntity.dart';
import 'package:ecommerce_app/domain/entities/RegisterResponseEntity.dart';
import 'package:ecommerce_app/domain/failuers.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<Failure, LoginResponseEntity>> login(
      String email, String password);
}