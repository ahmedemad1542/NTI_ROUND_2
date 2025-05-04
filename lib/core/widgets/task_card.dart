import 'package:finance_ui/core/ui/app_assets.dart';  
import 'package:finance_ui/core/ui/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TaskCard extends StatelessWidget {
  final Color? backgroundcolor;
  final String? grouptitle;
  final String? taskdescription;
  final String? iconpath;
  final Color? textcolor;

  const TaskCard({
    super.key,
    this.backgroundcolor,
    this.grouptitle,
    this.textcolor,
    this.taskdescription,
    this.iconpath,
  });

  @override
  Widget build(BuildContext context) {
    return 
       Container(
        padding: EdgeInsets.all(13),
        margin: EdgeInsets.symmetric(vertical: 10),
        width: 234.w,
        height: 90.h,
        decoration: BoxDecoration(
          color: backgroundcolor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Expanded(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    grouptitle ?? '',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: AppFonts.mainFont,
                      fontWeight: FontWeight.w400,
                      color: textcolor ?? Colors.white,
                      
                    ),  maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    taskdescription ?? '',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.mainFont,
                      fontWeight: FontWeight.w400,
                      color: textcolor ?? Colors.white,
                    
                    ),  maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 15.0),
              child: Column(children: [SvgPicture.asset(iconpath ?? '')]),
            ),
          ],
        ),
      )
    ;
  }
}
