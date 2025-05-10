import 'package:nti_r2/features/home/data/models/task_model.dart';

class TasksRepo {

  // Singleton
  TasksRepo._internal();
  static final TasksRepo _instance = TasksRepo._internal();
  factory TasksRepo() => _instance;

  List<TaskModel> _tasks = [];
  List<TaskModel> getTasks() {
    return _tasks;
  }

  void addTask(TaskModel task) {
    _tasks.add(task);
  }
}
