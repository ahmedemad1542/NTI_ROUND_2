import 'package:finance_ui/core/ui/app_fonts.dart';
import 'package:finance_ui/features/auth/view/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/widgets/primary_button_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 301.75.w,
                height: 342.86.h,
                child: SvgPicture.asset('assets/images/welcome.svg'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.14),
                child: SizedBox(
                  width: 147,
                  height: 60.h,
                  child: FittedBox(
                    child: Text(
                      'Welcome To\n  Do It !',
                      style: TextStyle(
                        fontFamily: AppFonts.mainFont,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff24252C),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: SizedBox(
                  width: 314.w,
                  height: 40.h,
                  child: FittedBox(
                    child: Text(
                      "Ready to conquer your tasks?\n Let's Do It together.",
                      style: TextStyle(
                        fontFamily: AppFonts.mainFont,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6E6A7C),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 55.59),
                child: PrimaryButtonWidget(
                  buttonText: "Let's Start",
                  fontSize: 19.sp,
                  textColor: Colors.white,
                  fontWeight: FontWeight.w300,
                  width: 331.w,
                  height: 48.01.h,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
