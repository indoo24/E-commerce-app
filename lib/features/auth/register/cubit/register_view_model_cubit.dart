import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/entities/RegisterResponseEntity.dart';
import 'package:ecommerce_app/domain/failuers.dart';
import 'package:ecommerce_app/domain/use_cases/register_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'register_view_model_state.dart';

@injectable
class RegisterViewModelCubit extends Cubit<RegisterViewModelState> {
  RegisterUseCase registerUseCase;

  RegisterViewModelCubit({required this.registerUseCase})
      : super(RegisterViewModelInitial());
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void register() async {
    emit(RegisterViewModelLoading());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,
        phoneController.text);
    either.fold((failure) {
      emit(RegisterViewModelError(failure));
    }, (registerResponseEntity) {
      emit(RegisterViewModelSuccess(registerResponseEntity));
    });
  }

  void onRegisterButtonPressed() {
    if (formKey.currentState!.validate()) {
      register();
    } else {
      emit(RegisterViewModelError(
          ServerError(errorMessage: 'Please enter valid data')));
    }
  }
}
