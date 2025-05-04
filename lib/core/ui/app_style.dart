import 'package:finance_ui/core/ui/app_colors.dart';
import 'package:finance_ui/core/ui/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyle {
  
  static TextStyle taskTitleStyle = TextStyle(
    fontFamily: AppFonts.mainFont,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static TextStyle primaryStyle = TextStyle(
    fontFamily: AppFonts.mainFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.black,
  );
}
