import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isPassword;

  final String? hinttext;

  const CustomTextfield({
    super.key,

    this.width,
    this.height,
    this.borderRadius,
    this.suffixIcon,
    this.prefixIcon,
    this.hinttext,
    this.isPassword,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 331.w,
      child: TextField(
        controller: controller,
        autofocus: false,
        obscureText: isPassword ?? false,
        decoration: InputDecoration(
          hintText: hinttext ?? "",
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: Color(0xff8391A1),
            fontWeight: FontWeight.w200,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
            borderSide: BorderSide(color: Color(0xffCDCDCD), width: 1.w),
          ),
          contentPadding: EdgeInsets.only(left: 16.w, top: 23.h, bottom: 22.h),
          filled: true,
          fillColor: Color(0xffF7F9F9),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
