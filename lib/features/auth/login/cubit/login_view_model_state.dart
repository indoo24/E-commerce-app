part of 'login_view_model_cubit.dart';

abstract class LoginViewModelState {}

class LoginViewModelInitial extends LoginViewModelState {}

class LoginViewModelLoading extends LoginViewModelState {}

class LoginViewModelError extends LoginViewModelState {
  final Failure failure;

  LoginViewModelError(this.failure);
}

class LoginViewModelSuccess extends LoginViewModelState {
  LoginResponseEntity loginResponseEntity;

  LoginViewModelSuccess(this.loginResponseEntity);
}
