import 'package:finance_ui/core/widgets/custom_textfield.dart';
import 'package:finance_ui/core/widgets/primary_button_widget.dart';
import 'package:finance_ui/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 375.w,
                height: 298.h,
                child: Image.asset(
                  'assets/images/1.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextfield(
                hinttext: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 10.h),
              CustomTextfield(
                hinttext: 'Password',
                isPassword: !isPasswordVisible,
                prefixIcon: Icon(Icons.key_rounded),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  color: const Color(0xff6A707C),
                ),
              ),
              SizedBox(height: 23.h),
              PrimaryButtonWidget(
                buttonText: "Login",
                fontSize: 25.sp,
                onPress: () {},
              ),
              SizedBox(height: 20.h),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Register()),
                  );
                },
                child: Text(
                  "Don’t Have An Account? Register",
                  style: TextStyle(fontSize: 14.sp, color: Color(0xff6E6A7C)),
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
