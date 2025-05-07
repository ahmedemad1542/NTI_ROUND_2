abstract class AddTasksState {}

class AddTasksInitialState extends AddTasksState {}

class AddTasksChangeEndDate extends AddTasksState {}

class AddTasksLoadingState extends AddTasksState {}

class AddTasksChangeGroupState extends AddTasksState {}

class AddTasksChangeImage extends AddTasksState {}

class AddTasksSuccessState extends AddTasksState {}

class AddTaskErrorState extends AddTasksState
{
  String error;
  AddTaskErrorState({required this.error});
}