import 'package:finance_ui/ui/app_colors.dart';
import 'package:finance_ui/ui/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static TextStyle primaryHeadlineStyle = TextStyle(
    fontFamily: AppFonts.mainFont,
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  static TextStyle secondryLinesStyles = TextStyle(
    fontFamily: AppFonts.mainFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryColor,
  );
  static TextStyle blackmidboldStyle = TextStyle(
    fontFamily: AppFonts.mainFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
}
