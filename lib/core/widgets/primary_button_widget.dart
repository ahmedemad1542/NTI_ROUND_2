import 'package:finance_ui/core/ui/app_colors.dart';
import 'package:finance_ui/core/ui/app_fonts.dart';
import 'package:finance_ui/core/ui/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String? buttonText;
 
  final Color? textColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final Widget? child;
  final void Function()? onPress;

  const PrimaryButtonWidget({
    super.key,
    this.buttonText,
    
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.width,
    this.borderRadius,
    this.onPress,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor:  AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 14.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 48.01.h),
      ),
      child:
          child ??
          Text(
            buttonText ?? '',
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: fontWeight ?? FontWeight.w300,
              fontSize: fontSize ?? 19.sp,
              fontFamily: AppFonts.mainFont,
            ),
          ),
    );
  }
}
