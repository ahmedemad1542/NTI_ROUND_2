import 'package:finance_ui/core/ui/app_strings.dart';
import 'package:finance_ui/core/ui/app_assets.dart';
import 'package:finance_ui/core/ui/app_colors.dart';
import 'package:finance_ui/core/ui/app_padding.dart';
import 'package:finance_ui/core/ui/app_style.dart';
import 'package:finance_ui/core/widgets/custom_svg.dart';
import 'package:finance_ui/core/widgets/primary_button_widget.dart';
import 'package:finance_ui/core/widgets/settings_container.dart';
import 'package:finance_ui/features/options/change_password.dart';
import 'package:finance_ui/features/options/settings_page.dart';
import 'package:finance_ui/features/options/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F5F4),
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.viewPadding,
          child: ListView(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 16),
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grey,
                          image: DecorationImage(
                            image: AssetImage(AppAssets.logo),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.hello,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12.sp,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Profile(),
                                  ),
                                );
                              },
                              child: Text(
                                "Ahmed Emad",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16.sp,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SettingsContainer(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateProfile(),
                        ),
                      );
                    },
                    buttonText: 'Profile',
                    iconPath: AppAssets.profile,
                  ),
                  SettingsContainer(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangePassword(),
                        ),
                      );
                    },
                    buttonText: 'Change Password',
                    iconPath: AppAssets.profile,
                  ),
                  SettingsContainer(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ),
                      );
                    },
                    buttonText: 'Settings',
                    iconPath: AppAssets.profile,
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
