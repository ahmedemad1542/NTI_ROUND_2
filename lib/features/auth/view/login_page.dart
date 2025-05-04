import 'package:finance_ui/core/widgets/custom_textfield.dart';
import 'package:finance_ui/core/widgets/primary_button_widget.dart';
import 'package:finance_ui/features/auth/view/register_page.dart';
import 'package:finance_ui/features/Tasks/no_tasks_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPasswordVisible = false;
  bool rememberMe = false; // New state for checkbox

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
                height: 290.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xffF9F5E4),
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              SizedBox(height: 20.h),
              CustomTextfield(hinttext: 'Username'),
              SizedBox(height: 10.h),
              CustomTextfield(
                hinttext: 'Password',
                isPassword: !isPasswordVisible,

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
              SizedBox(height: 10.h),

              Padding(padding: EdgeInsets.symmetric(horizontal: 10.w)),
              SizedBox(height: 13.h),
              PrimaryButtonWidget(
                buttonText: "Login",

                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const NoTasksHome()),
                  );

                  if (rememberMe) {
                    // Save login credentials if rememberMe is checked
                  }
                },
              ),

              SizedBox(height: 41.h),
              Row(
                children: [
                  Text(
                    "Don't Have An Account? Register",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const Register()),
                        (route) => false,
                      );
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
