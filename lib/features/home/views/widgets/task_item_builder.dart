import 'package:finance_ui/core/ui/app_colors.dart';
import 'package:finance_ui/core/ui/app_style.dart';
import 'package:flutter/material.dart';

class TaskItemBuilder extends StatelessWidget {
  const TaskItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryLight,
        
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My First Task',
                  style: AppStyle.taskTitleStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 13),
                Text(
                  "Improve my English skills by trying to speek",
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '11/03/2025 5:00PM'.split(" ").first,
                  style: AppStyle.taskTitleStyle,
                ),
                Text(
                  '11/03/2025 05:00PM'.split(" ")[1],
                  style: AppStyle.taskTitleStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
