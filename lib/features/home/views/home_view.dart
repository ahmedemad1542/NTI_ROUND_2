import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_r2/core/helper/my_navigator.dart';
import 'package:nti_r2/core/helper/my_responsive.dart';
import 'package:nti_r2/core/translation/translation_keys.dart';
import 'package:nti_r2/core/utils/app_assets.dart';
import 'package:nti_r2/core/utils/app_colors.dart';
import 'package:nti_r2/features/home/cubit/user_cubit/user_cubit.dart';
import 'package:nti_r2/features/home/cubit/user_cubit/user_state.dart';
import 'package:nti_r2/features/home/data/models/task_model.dart';

import '../../add_task/views/add_task_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: AppColors.primary,
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
          onPressed: () {
            MyNavigator.goTo(screen: () => AddTaskView());
          }),
      appBar: AppBar(
        toolbarHeight: MyResponsive.height(context, value: 80),
        title: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(end: 16),
                  height: MyResponsive.height(context, value: 60),
                  width: MyResponsive.height(context, value: 60),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(AppAssets.flag),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TranslationKeys.hello.tr,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: AppColors.black),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      if (state is UserGetSuccess)
                        Text(
                          state.userModel.userName ?? 'No Name',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: AppColors.black),
                        ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
      body: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        if (state is UserGetTasksSuccessState) {
          return ListView.builder(
            itemBuilder: (context, index) =>
                TaskBuilder(taskModel: state.tasks[index]),
            itemCount: state.tasks.length,
          );
        }
        return SizedBox();
      }),
    );
  }
}

class TaskBuilder extends StatelessWidget {
  const TaskBuilder({super.key, required this.taskModel});

  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Task ${taskModel.title}'),
            Text('Task ${taskModel.description}'),
          ],
        ));
  }
}
