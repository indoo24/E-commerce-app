import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../resources/color_mananger.dart';

class CustomPasswordFiled extends StatefulWidget {
  final String? hintText;
  bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final BorderRadius borderRadius;

  CustomPasswordFiled({
    required this.hintText,
    required this.borderRadius,
    this.obscureText = true,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.controller,
  });

  @override
  State<CustomPasswordFiled> createState() => _CustomPasswordFiledState();
}

class _CustomPasswordFiledState extends State<CustomPasswordFiled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSize.s8),
      child: TextFormField(
        obscureText: widget.obscureText,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  widget.obscureText = !widget.obscureText;
                });
              },
              icon: widget.obscureText
                  ? const Icon(
                      Icons.visibility_off,
                      color: ColorManager.primary,
                    )
                  : const Icon(
                      Icons.visibility,
                      color: ColorManager.primary,
                    )),
          filled: true,
          fillColor: ColorManager.white,
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: widget.borderRadius,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius,
            borderSide: const BorderSide(
              color: ColorManager.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius,
            borderSide: const BorderSide(
              color: ColorManager.white,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius,
            borderSide: const BorderSide(
              color: ColorManager.red,
            ),
          ),
        ),
      ),
    );
  }
}
