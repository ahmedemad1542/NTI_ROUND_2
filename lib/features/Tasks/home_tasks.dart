import 'package:finance_ui/core/ui/app_strings.dart';
import 'package:finance_ui/core/ui/app_assets.dart';
import 'package:finance_ui/core/ui/app_colors.dart';
import 'package:finance_ui/core/ui/app_fonts.dart';
import 'package:finance_ui/core/ui/app_padding.dart';
import 'package:finance_ui/core/widgets/custom_svg.dart';
import 'package:finance_ui/core/widgets/task_card.dart';
import 'package:finance_ui/features/Tasks/add_tasks.dart';
import 'package:finance_ui/features/home/views/widgets/task_item_builder.dart';
import 'package:finance_ui/features/today_tasks.dart';
import 'package:finance_ui/features/options/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     floatingActionButton: FloatingActionButton(
  backgroundColor: Colors.transparent,
  elevation: 0,
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTasks()),
    );
  },
  child: SvgPicture.asset(AppAssets.save),
),
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.viewPadding,
          child: SingleChildScrollView(
            child: Column(
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
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w300,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            'Ahmed Emad',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 34.0),
                  child: Container(
                    width: 335.w,
                    height: 135,

                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(
                        30.r,
                      ), //border radius(
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 18.0,
                            left: 22.0,
                          ), //padding(8.0),
                          child: Text(
                            "Your today's tasks\n almost done!",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: AppFonts.mainFont,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 18.0,
                                left: 22.0,
                              ),
                              child: Text(
                                '35%',
                                style: TextStyle(
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 22.0,
                                bottom: 18,
                              ), //padding(8.0),
                              child: InkWell(
                                child: Container(
                                  height: 36.h,
                                  width: 121.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14.r),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'View Tasks',
                                      style: TextStyle(
                                        color: Color(0xff149954),
                                        fontSize: 15.sp,
                                        fontFamily: AppFonts.mainFont,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        SizedBox(
                          width: 120.w,
                          height: 18.h,
                          child: Row(
                            children: [
                              Text(
                                'In Progress',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: AppFonts.mainFont,
                                ),
                              ),
                              Spacer(),
                              SvgPicture.asset(AppAssets.arrow),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: SizedBox(
                    height: 150.h,
                    width: 234.w,

                    child: PageView(
                      children: [
                        TaskCard(
                          grouptitle: 'Work Task',
                          taskdescription: 'Add New Features',
                          iconpath: AppAssets.work,
                          backgroundcolor: Colors.black,
                        ),
                        TaskCard(
                          grouptitle: 'personal Task',

                          taskdescription:
                              'Improve my English skills by trying to speek',
                          iconpath: AppAssets.work,
                          backgroundcolor: Color(0xffCEEBDC),
                        ),
                        TaskCard(
                          grouptitle: 'Home Task',
                          taskdescription:
                              'Add new feature for Do It app and commit it',
                          iconpath: AppAssets.work,
                          backgroundcolor: Color(0xffFFE4F2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
