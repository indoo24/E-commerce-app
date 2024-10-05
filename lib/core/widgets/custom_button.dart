import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_mananger.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class SpinnerButton extends StatefulWidget {
  final bool isLoading;
  final bool isSuccess;
  final String textName;
  final String actionText;
  final Function()? onPressed;
  final Color textColor;
  final Color buttonColor;
  final double width;
  final Duration successDuration;

  const SpinnerButton({
    super.key,
    required this.actionText,
    required this.textName,
    required this.textColor,
    required this.isLoading,
    required this.isSuccess,
    required this.width,
    this.onPressed,
    this.buttonColor = Colors.blue,
    this.successDuration = const Duration(seconds: 2),
  });

  @override
  _SpinnerButtonState createState() => _SpinnerButtonState();
}

class _SpinnerButtonState extends State<SpinnerButton> {
  bool showSuccess = false;
  Color? currentButtonColor;

  @override
  void initState() {
    super.initState();
    currentButtonColor = widget.buttonColor;
  }

  @override
  void didUpdateWidget(covariant SpinnerButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSuccess && !oldWidget.isSuccess) {
      setState(() {
        showSuccess = true;
        currentButtonColor = Colors.green;
      });

      Future.delayed(widget.successDuration, () {
        if (mounted) {
          setState(() {
            showSuccess = false;
            currentButtonColor = widget.buttonColor;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isLoading ? null : widget.onPressed,
      child: Container(
        width: widget.width,
        height: AppSize.s64.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s32),
          color: currentButtonColor,
        ),
        child: Center(
          child: widget.isLoading
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
                        color: widget.textColor,
                      ),
                    ),
                  ],
                )
              : showSuccess
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                        SizedBox(width: AppSize.s8.w),
                        Text(
                          widget.actionText,
                          style: getBoldStyle(
                            fontSize: FontSizeManager.s20.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      widget.textName,
                      style: getBoldStyle(
                        fontSize: FontSizeManager.s20.sp,
                        color: widget.textColor,
                      ),
                    ),
        ),
      ),
    );
  }
}
