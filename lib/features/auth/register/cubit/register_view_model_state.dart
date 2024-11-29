part of 'register_view_model_cubit.dart';

@immutable
abstract class RegisterViewModelState {}

class RegisterViewModelInitial extends RegisterViewModelState {}

class RegisterViewModelLoading extends RegisterViewModelState {}

class RegisterViewModelError extends RegisterViewModelState {
  Failure failure;
  RegisterViewModelError(this.failure);
}

class RegisterViewModelSuccess extends RegisterViewModelState {
  RegisterResponseEntity registerResponseEntity;
  RegisterViewModelSuccess(this.registerResponseEntity);
}

