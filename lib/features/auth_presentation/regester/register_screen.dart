import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_mananger.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widgets/custom_text_filed.dart';
import 'package:ecommerce_app/core/widgets/validators.dart';
import 'package:ecommerce_app/domain/di/di.dart';
import 'package:ecommerce_app/features/auth_presentation/regester/cubit/register_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/font_manager.dart';
import '../../../core/widgets/custom_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterViewModelCubit viewModel = getIt<RegisterViewModelCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModelCubit, RegisterViewModelState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterViewModelError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.failure.errorMessage),
          ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorManager.primary,
        ),
        body: Container(
          padding: EdgeInsets.all(AppPadding.p16.h),
          color: ColorManager.primary,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(ImageAssets.logo),
                SizedBox(
                  height: AppSize.s32.h,
                ),
                Text(
                  'Full Name',
                  style: getMediumStyle(
                    fontSize: FontSizeManager.s20.dm,
                    color: ColorManager.white,
                  ),
                ),
                SizedBox(
                  height: AppSize.s8.h,
                ),
                CustomTextFiled(
                  validator: AppValidators.validateName,
                  controller: viewModel.nameController,
                  hintText: 'Enter your full name',
                  borderRadius: BorderRadius.circular(AppSize.s16),
                ),
                SizedBox(
                  height: AppSize.s16.h,
                ),
                Text(
                  'Mobile Number',
                  style: getMediumStyle(
                    fontSize: FontSizeManager.s20.sp,
                    color: ColorManager.white,
                  ),
                ),
                SizedBox(
                  height: AppSize.s8.h,
                ),
                CustomTextFiled(
                  validator: AppValidators.validatePhoneNumber,
                  controller: viewModel.phoneController,
                  hintText: 'Enter your phone number',
                  borderRadius: BorderRadius.circular(AppSize.s16),
                ),
                SizedBox(
                  height: AppSize.s16.h,
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
                Text(
                  'Re-enter Password',
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
                  controller: viewModel.confirmPasswordController,
                  hintText: 'Re-enter your password',
                  borderRadius: BorderRadius.circular(AppSize.s16),
                ),
                SizedBox(height: AppSize.s24),
                BlocBuilder<RegisterViewModelCubit, RegisterViewModelState>(
                  bloc: viewModel,
                  builder: (context, state) {
                    return CustomButton(
                        textName: AppConstants.signUp,
                        buttonColor: ColorManager.white,
                        textColor: ColorManager.primary,
                        isLoading: state is RegisterViewModelLoading,
                        isSuccess: state is RegisterViewModelSuccess,
                        onPressed: () {
                          viewModel.register();
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
