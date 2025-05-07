import 'package:finance_ui/core/ui/app_assets.dart';
import 'package:finance_ui/core/widgets/custom_textfield.dart';
import 'package:finance_ui/core/widgets/drop_button.dart';
import 'package:finance_ui/core/widgets/endtime_picker.dart';
import 'package:finance_ui/core/widgets/primary_button_widget.dart';
import 'package:finance_ui/features/today_tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTasks extends StatelessWidget {
  const AddTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F5F4),
      appBar: AppBar(backgroundColor: Colors.white, title: Text('Add Task')),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 261,
                height: 207,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: SizedBox(
                    width: 261.w,
                    height: 207.h,
                    child: Image.asset(AppAssets.logo),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 29.0),
                child: CustomTextfield(
                  hinttext: 'Title',
                  width: 331.w,
                  height: 63.h,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17.0),
                child: CustomTextfield(
                  hinttext: 'Description',
                  width: 331.w,
                  height: 63.h,
                ),
              ),
              SizedBox(height: 15.h),
              SizedBox(height: 63.h, width: 331.w, child: GroupDropdown()),
              Container(
                width: 331.w,
                height: 63.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Colors.white,
                ),
                
                child: EndTimePicker(onDateTimeSelected: (DateTime value) {}),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: PrimaryButtonWidget(width: 331.w, height: 52.01.h ,buttonText: 'Add Task', onPress: () {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const TodayTasks()),
    );
  }, ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
