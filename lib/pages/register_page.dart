import 'package:finance_ui/core/widgets/custom_textfield.dart';
import 'package:finance_ui/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  String? selectedGender; // To store the selected gender

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void validatePassword() {
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    // Combined regex pattern for password validation
    const pattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@_])[A-Za-z\d@_]{8,}$';
    final regExp = RegExp(pattern);

    if (usernameController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Username cannot be empty')));
    } else if (selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select your gender')),
      );
    } else if (password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Password cannot be empty')));
    } else if (!regExp.hasMatch(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Password must contain at least:\n- 1 uppercase letter\n- 1 lowercase letter\n- 1 number\n- 1 special character (@ or _)\n- Minimum 8 characters',
          ),
        ),
      );
    } else if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
    } else {
      // Registration is valid
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registered successfully as $selectedGender')),
      );
    }
  }

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
                child: Image.asset('assets/images/1.png', fit: BoxFit.cover),
              ),
              SizedBox(height: 20.h),
              CustomTextfield(
                controller: usernameController,
                hinttext: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 10.h),
              // Gender Dropdown
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff6A707C).withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedGender,
                  hint: Text(
                    'Select Gender',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xff6A707C).withOpacity(0.6),
                    ),
                  ),
                  items:
                      ['Male', 'Female']
                          .map(
                            (gender) => DropdownMenuItem<String>(
                              value: gender,
                              child: Text(
                                gender,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xff6A707C),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  icon: Icon(Icons.arrow_drop_down, color: Color(0xff6A707C)),
                  decoration: InputDecoration.collapsed(hintText: ''),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10.h),
              CustomTextfield(
                controller: passwordController,
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
              CustomTextfield(
                controller: confirmPasswordController,
                hinttext: 'Confirm your Password',
                isPassword: !isConfirmPasswordVisible,
                prefixIcon: Icon(Icons.key),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                  icon: Icon(
                    isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  color: const Color(0xff6A707C),
                ),
              ),
              SizedBox(height: 23.h),
              PrimaryButtonWidget(
                buttonText: "Register",
                fontSize: 25.sp,
                onPress: validatePassword,
              ),
              SizedBox(height: 20.h),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Login()),
                  );
                },
                child: Text(
                  "Already Have An Account? Login",
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
