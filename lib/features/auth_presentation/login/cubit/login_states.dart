import 'package:ecommerce_app/domain/entities/LoginResponsEntity.dart';
import 'package:ecommerce_app/domain/failuers.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  Failure failure;

  LoginErrorState({required this.failure});
}

class LoginSuccessState extends LoginStates {
  LoginResponseEntity loginResponseEntity;

  LoginSuccessState({required this.loginResponseEntity});
}
