import 'package:finance_ui/core/ui/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodayTasks extends StatelessWidget {
  const TodayTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 120.w),
            Text(
              'Tasks',
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w300,
                fontFamily: AppFonts.mainFont,
              ),
            ),
          ],
        ),
        SizedBox(height: 23.h,),
        Container(
  width: 331.w,
  height: 45.h,
  padding: EdgeInsets.symmetric(horizontal: 12.w),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey.shade400),
    borderRadius: BorderRadius.circular(8.r),
    color: Colors.white,
  ),
  child: Row(
    children: [
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search . . .',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Color(0xff6E6A7C), fontFamily: AppFonts.mainFont, fontSize: 14.sp, fontWeight: FontWeight.w200),
          ),
        ),
      ),
      Icon(Icons.search, color: Colors.black),
    ],
  ),
),
Row(
  children: [
   SizedBox(width:101.w, height: 18.h, child: Text('Results', style: TextStyle(fontFamily: AppFonts.mainFont, fontSize: 14.sp, fontWeight: FontWeight.w300),)),
  ],
), SizedBox(height: 27.h,),

],
      )),
    );
  }
}