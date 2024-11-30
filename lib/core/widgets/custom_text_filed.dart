import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../resources/color_mananger.dart';

class CustomTextFiled extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final BorderRadius borderRadius;

  CustomTextFiled({
    required this.hintText,
    required this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSize.s8),
      child: TextFormField(
        obscureText: obscureText,
        validator: validator,
        keyboardType: keyboardType,
        controller: controller,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: ColorManager.white,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: borderRadius,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(
              color: ColorManager.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(
              color: ColorManager.white,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(
              color: ColorManager.red,
            ),
          ),
        ),
      ),
    );
  }
}
