import 'package:finance_ui/core/ui/app_strings.dart';
import 'package:finance_ui/core/ui/app_assets.dart';
import 'package:finance_ui/core/ui/app_colors.dart';
import 'package:finance_ui/core/ui/app_padding.dart';
import 'package:finance_ui/core/ui/app_style.dart';
import 'package:finance_ui/core/widgets/custom_svg.dart';
import 'package:finance_ui/features/Tasks/home_tasks.dart';
import 'package:finance_ui/features/today_tasks.dart';
import 'package:finance_ui/features/options/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NoTasksHome extends StatelessWidget {
  const NoTasksHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: SvgPicture.asset(AppAssets.save),
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.viewPadding,
          child: ListView(
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
                    // child: Image.asset(AppAssets.logo),
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
                          onTap: () => Profile(),
                          child: GestureDetector(
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Profile(),
                                  ),
                                ),
                            child: Text(
                              "Ahmed Emad",
                              maxLines: 1,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w300,
                                fontSize: 16.sp,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeTasks(),
                        ),
                      );
                    },
                    icon: CustomSvg(path: AppAssets.addIcon),
                  ),
                ],
              ),
              SizedBox(height: 60.h, width: 325.w),
              Center(
                child: Text(AppStrings.emptyData, style: AppStyle.primaryStyle),
              ),
              Padding(
                padding: EdgeInsets.only(top: 39.h),
                child: SvgPicture.asset(AppAssets.noDataAvatar),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
