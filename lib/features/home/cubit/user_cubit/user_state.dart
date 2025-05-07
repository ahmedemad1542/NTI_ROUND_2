import 'package:finance_ui/features/home/data/models/task_model.dart';
import 'package:finance_ui/features/home/data/models/user_model.dart';


abstract class UserState {}

class UserInitial extends UserState {}

class UserGetSuccess extends UserState {
  UserModel userModel;
  UserGetSuccess({required this.userModel});
}

class UserGetTasksLoadingState extends UserState {}

class UserGetTasksSuccessState extends UserState {
  List<TaskModel> tasks;
  UserGetTasksSuccessState({required this.tasks});
}

class UserGetTasksErrorState extends UserState {
  String message;
  UserGetTasksErrorState({required this.message});
}
