import 'package:finance_ui/core/ui/app_colors.dart';
import 'package:finance_ui/core/widgets/custom_textfield.dart';
import 'package:finance_ui/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 375.w,
            height: 298.h,
            child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
          ),
          SizedBox(height: 23.h),
          CustomTextfield(hinttext: 'Old Password'),
          SizedBox(height: 10.h),
          CustomTextfield(hinttext: 'New Password'),
          SizedBox(height: 10.h),
          CustomTextfield(hinttext: 'Confirm Password'),
          SizedBox(height: 23.h),
          PrimaryButtonWidget(buttonText: 'Save'),
        ],
      ),
    );
  }
}
