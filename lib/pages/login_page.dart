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
              SizedBox(height: 10.h),
              // Remember me checkbox row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.scale(
                      scale: 0.9, // Slightly smaller checkbox
                      child: Checkbox(
                        value: rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        },
                        activeColor: Color(0xff6A707C), // Matching your theme
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    Text(
                      'Remember me',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff6A707C),
                      ),
                    ),
                    Spacer(), // Pushes the forgot password to the right
                    TextButton(
                      onPressed: () {
                        // Add forgot password functionality
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xff6A707C),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 13.h), // Reduced spacing
              PrimaryButtonWidget(
                buttonText: "Login",
                fontSize: 25.sp,
                onPress: () {
                  // Add login logic here
                  if (rememberMe) {
                    // Save login credentials if rememberMe is checked
                  }
                },
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
                  "Don't Have An Account? Register",
                  style: TextStyle(fontSize: 14.sp, color: Color(0xff6E6A7C)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}