import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/color_mananger.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final bool isSuccess;
  final String textName;
  final Function()? onPressed;
  final Color textColor;
  final Color? buttonColor;

  const CustomButton({
    super.key,
    required this.textName,
    required this.textColor,
    required this.isLoading,
    required this.isSuccess,
    this.onPressed,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onPressed,
      child: Container(
        width: double.infinity,
        height: AppSize.s64.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s32),
          color: buttonColor,
        ),
        child: Center(
          child: isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                    SizedBox(width: AppSize.s8.w),
                    Text(
                      'Loading...',
                      style: getBoldStyle(
                        fontSize: FontSizeManager.s20.sp,
                        color: textColor,
                      ),
                    ),
                  ],
                )
              : isSuccess
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: ColorManager.green,
                        ),
                        SizedBox(width: AppSize.s8.w),
                        Text(
                          'Register Successfully',
                          style: getBoldStyle(
                            fontSize: FontSizeManager.s20.sp,
                            color: textColor,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      textName,
                      style: getBoldStyle(
                        fontSize: FontSizeManager.s20.sp,
                        color: textColor,
                      ),
                    ),
        ),
      ),
    );
  }
}
