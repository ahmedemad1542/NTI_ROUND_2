import 'package:finance_ui/ui/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finance_ui/pages/welcome_page.dart'; // تأكد من مسار الملف الصحيح

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppThemes.lightTheme,
          home: const WelcomePage(), // هنا التغيير
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
