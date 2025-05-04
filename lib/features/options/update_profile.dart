import 'package:finance_ui/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

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
          CustomTextfield(hinttext: 'Username'),
        ],
      ),
    );
  }
}
