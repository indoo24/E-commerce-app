import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_mananger.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_maneger/routes.dart';
import 'package:ecommerce_app/core/widgets/custom_text_filed.dart';
import 'package:ecommerce_app/core/widgets/validators.dart';
import 'package:ecommerce_app/domain/di/di.dart';
import 'package:ecommerce_app/features/auth_presentation/login/cubit/login_states.dart';
import 'package:ecommerce_app/features/auth_presentation/login/cubit/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/font_manager.dart';
import '../../../core/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.failure.errorMessage),
          ));
        }
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(AppPadding.p16),
          color: ColorManager.primary,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: AppSize.s56),
                Image.asset(ImageAssets.logo),
                SizedBox(
                  height: AppSize.s32,
                ),
                Text(
                  'Welcome Back to Route',
                  style: getBoldStyle(
                    fontSize: FontSizeManager.s24.sp,
                    color: ColorManager.white,
                  ),
                ),
                Text(
                  'please signin with your mail',
                  style: getMediumStyle(
                    fontSize: FontSizeManager.s16.sp,
                    color: ColorManager.white,
                  ),
                ),
                SizedBox(
                  height: AppSize.s32,
                ),
                Text(
                  'Email Address',
                  style: getMediumStyle(
                    fontSize: FontSizeManager.s20.sp,
                    color: ColorManager.white,
                  ),
                ),
                SizedBox(
                  height: AppSize.s8.h,
                ),
                CustomTextFiled(
                  validator: AppValidators.validateEmail,
                  controller: viewModel.emailController,
                  hintText: 'Enter your email address',
                  borderRadius: BorderRadius.circular(AppSize.s16),
                ),
                SizedBox(
                  height: AppSize.s16.h,
                ),
                Text(
                  'Password',
                  style: getMediumStyle(
                    fontSize: FontSizeManager.s20.sp,
                    color: ColorManager.white,
                  ),
                ),
                SizedBox(
                  height: AppSize.s8.h,
                ),
                CustomTextFiled(
                  obscureText: true,
                  validator: AppValidators.validatePassword,
                  controller: viewModel.passwordController,
                  hintText: 'Enter your password',
                  borderRadius: BorderRadius.circular(AppSize.s16),
                ),
                SizedBox(
                  height: AppSize.s16.h,
                ),
                SizedBox(height: AppSize.s24),
                BlocBuilder<LoginViewModel, LoginStates>(
                  bloc: viewModel,
                  builder: (context, state) {
                    return CustomButton(
                        textName: AppConstants.login,
                        buttonColor: ColorManager.white,
                        textColor: ColorManager.primary,
                        isLoading: state is LoginLoadingState,
                        isSuccess: state is LoginSuccessState,
                        onPressed: () {
                          viewModel.login();
                        });
                  },
                ),
                SizedBox(
                  height: AppSize.s16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: getBoldStyle(
                        fontSize: FontSizeManager.s20.sp,
                        color: ColorManager.white,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signUpRoute);
                        },
                        child: Text(
                          "Create account",
                          style: getBoldStyle(
                            fontSize: FontSizeManager.s20.sp,
                            color: ColorManager.white,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
