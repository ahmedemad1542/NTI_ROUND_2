import 'package:finance_ui/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final double? borderRadius;
  void Function()? onPress;
   PrimaryButtonWidget({
    super.key,
    this.buttonText,
    this.buttonColor,
    this.textColor,
    this.fontSize,
    this.height,
    this.width,
    this.borderRadius,
    this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 14.r),
          
          
        ),
        fixedSize: Size(width ?? 331.w, height ?? 48.01.h)
      ),
      child: Text(
        buttonText ?? '',
        style: TextStyle(color: textColor ?? Colors.white,fontWeight: FontWeight.w300 , fontSize: fontSize ?? 19.sp),
      ),
    );
  }
}
