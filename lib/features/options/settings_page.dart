import 'package:finance_ui/core/ui/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isEnglish = true; // true = EN, false = AR

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 110.w),
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w300,
                    fontFamily: AppFonts.mainFont,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20.w),Text('Language', style: TextStyle(fontSize: 20.sp)),
                Spacer(),
                Container(
                  width: 102.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      _buildSwitchOption('AR', !isEnglish),
                      _buildSwitchOption('EN', isEnglish),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchOption(String text, bool isActive) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isEnglish = (text == 'EN');
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isActive ? Colors.green : Colors.transparent,
            borderRadius: BorderRadius.horizontal(
              left: text == 'AR' ? Radius.circular(8.r) : Radius.zero,
              right: text == 'EN' ? Radius.circular(8.r) : Radius.zero,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
