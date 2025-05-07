import 'package:finance_ui/core/cache/cache_data.dart';
import 'package:finance_ui/core/cache/cache_helper.dart';
import 'package:finance_ui/core/cache/cache_keys.dart';
import 'package:finance_ui/core/helper/my_navigator.dart';
import 'package:finance_ui/core/ui/theme_data.dart';
import 'package:finance_ui/features/auth/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finance_ui/features/welcome_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return  GetMaterialApp(
          title: 'Flutter Demo',
          theme: AppThemes.lightTheme,
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      CacheData.firstTime = CacheHelper.getData(key: CacheKeys.firstTime);
      if (CacheData.firstTime != null) {
        MyNavigator.goTo(screen: Login(), isReplace: true);
      } else {
        MyNavigator.goTo(screen: WelcomePage(), isReplace: true);
      }
      {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/splash.png',
          width: 334.w,
          height: 343.94.h,
        ),
      ),
    );
  }
}
