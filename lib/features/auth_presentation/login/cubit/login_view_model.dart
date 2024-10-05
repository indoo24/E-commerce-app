import 'package:ecommerce_app/core/routes_maneger/routes.dart';
import 'package:ecommerce_app/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_app/features/auth_presentation/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void login(BuildContext context) async {
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(
        emailController.text, passwordController.text);
    either.fold((l) => emit(LoginErrorState(failure: l)), (response) {
      emit(LoginSuccessState(loginResponseEntity: response));
      Navigator.pushNamed(context, Routes.homeScreenRoute);
    });
  }
}
