import 'package:finance_ui/core/ui/app_assets.dart';
import 'package:finance_ui/core/ui/app_colors.dart';
import 'package:finance_ui/core/ui/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsContainer extends StatelessWidget {
  final String? buttonText;
  final String? iconPath;

  final void Function()? onTap;

  const SettingsContainer({
    super.key,
    this.buttonText,
    this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 331.w,
        height: 63.h,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 32, offset: Offset(0, 4)),
          ],
        ),

        child: Row(
          children: [
            SizedBox(
              width: 24.w,
              height: 24.h,
              child: SvgPicture.asset(iconPath ?? ''),
            ),
            Text(
              buttonText ?? '',
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
            Spacer(),
            SvgPicture.asset(AppAssets.arrow),
          ],
        ),
      ),
    );
  }
}
