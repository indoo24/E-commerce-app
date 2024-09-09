import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/LoginResponseEntity.dart';
import 'package:ecommerce_app/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../failuers.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failure, LoginResponseEntity>> invoke(
    String email,
    String password,
  ) {
    return authRepository.login(
      email,
      password,
    );
  }
}
