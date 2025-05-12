import 'dart:io';

import 'package:finance_ui/core/helper/my_navigator.dart';
import 'package:finance_ui/core/ui/app_assets.dart';
import 'package:finance_ui/core/widgets/custom_textfield.dart';
import 'package:finance_ui/core/widgets/image_manager/image_manager_view.dart';
import 'package:finance_ui/core/widgets/primary_button_widget.dart';
import 'package:finance_ui/features/auth/manager/register_cubit.dart/register_cubit.dart';
import 'package:finance_ui/features/auth/manager/register_cubit.dart/register_state.dart';
import 'package:finance_ui/features/valdiation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'login_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void validatePassword() {
    final username = usernameController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    final usernameError = Validator.validateUsername(username);
    final passwordError = Validator.validatePassword(password);
    final confirmError = Validator.confirmPasswords(password, confirmPassword);

    if (usernameError != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(usernameError)));
    } else if (passwordError != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(passwordError)));
    } else if (confirmError != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(confirmError)));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Registered successfully')));
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Login()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterErrorState) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.error)));
                    } else if (state is RegisterSuccessState) {
                      MyNavigator.goTo(
                        screen: () => const Login(),
                        isReplace: true,
                      );
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: RegisterCubit.get(context).formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            ImageManagerView(
                              onPicked: (XFile image) {
                                RegisterCubit.get(context).image = image;
                              },
                              pickedBody: (XFile image) {
                                return Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.36,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                    image: DecorationImage(
                                      image: FileImage(File(image.path)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                              unPickedBody: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  AppAssets.logo,
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.36,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            CustomTextfield(
                              controller: usernameController,
                              hinttext: 'Username',
                            ),
                            SizedBox(height: 10.h),
                            CustomTextfield(
                              controller: passwordController,
                              hinttext: 'Password',
                              isPassword: !isPasswordVisible,
                            ),
                            SizedBox(height: 10.h),
                            CustomTextfield(
                              controller: confirmPasswordController,
                              hinttext: 'Confirm your Password',
                              isPassword: !isConfirmPasswordVisible,
                            ),
                            SizedBox(height: 23.h),
                            PrimaryButtonWidget(
                              buttonText: "Register",
                              onPress: validatePassword,
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already Have An Account?",
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
                                      MaterialPageRoute(
                                        builder: (_) => const Login(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  child: Text(
                                    "Login",
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
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
