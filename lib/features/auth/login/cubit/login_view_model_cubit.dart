import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/entities/LoginResponsEntity.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/widgets/shared_pref_utils.dart';
import '../../../../domain/failuers.dart';
import '../../../../domain/use_cases/login_use_case.dart';

part 'login_view_model_state.dart';

@injectable
class LoginViewModelCubit extends Cubit<LoginViewModelState> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController(text: "indoo@gmail.com");
  var passwordController = TextEditingController(text: "Indoo2024");

  LoginUseCase loginUseCase;

  LoginViewModelCubit({required this.loginUseCase})
      : super(LoginViewModelInitial());

  void login() async {
    emit(LoginViewModelLoading());
    var either = await loginUseCase.invoke(
        emailController.text, passwordController.text);
    either.fold((failure) {
      emit(LoginViewModelError(failure));
    }, (response) {
      emit(LoginViewModelSuccess(response));
      SharedPrefUtils.saveDate(key: 'token', value: response.token);
      print('token ${response.token}');
    });
  }

  void onLoginButtonPressed() {
    if (formKey.currentState!.validate()) {
      login();
    } else {
      emit(LoginViewModelError(
          ServerError(errorMessage: 'Please enter valid data')));
    }
  }
}
