import 'package:finance_ui/core/ui/app_colors.dart';
import 'package:finance_ui/features/Tasks/data/model/category_model.dart';
import 'package:finance_ui/features/Tasks/manager/add_tasks_cubit/add_tasks_stats.dart';
import 'package:finance_ui/features/home/data/Repo/tasks_repo.dart';
import 'package:finance_ui/features/home/data/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddTasksCubit extends Cubit<AddTasksState> {
  AddTasksCubit() : super(AddTasksInitialState());
  static AddTasksCubit get(context) => BlocProvider.of(context);
  TasksRepo tasksRepo = TasksRepo();

  List<CategoryModel> categories = [
    CategoryModel(
      title: 'Home',
      icon: Icon(Icons.home, color: AppColors.primaryColor),
      bgColor: AppColors.black,
    ),
    CategoryModel(
      title: 'Personal',
      icon: Icon(Icons.person, color: AppColors.primaryColor),
      bgColor: AppColors.black,
    ),
    CategoryModel(
      title: 'Work',
      icon: Icon(Icons.work, color: AppColors.primaryColor),
      bgColor: AppColors.black,
    ),
  ];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? endDate;
  CategoryModel? group;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void changeEndDate(DateTime date) {
    endDate = date;
    emit(AddTasksChangeEndDate());
  }

  void changeGroup(CategoryModel group) {
    this.group = group;
    emit(AddTasksChangeGroupState());
  }

  void onAddTaskPressed() {
    emit(AddTasksLoadingState());
    if (!formKey.currentState!.validate()) return;
    tasksRepo.addTask(
      TaskModel(
        title: titleController.text,
        description: descriptionController.text,
        categoryModel: group!,
        endDate: endDate!,
        group: '',
      ),
    );
    emit(AddTasksSuccessState());
  }

  XFile? image;
  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    emit(AddTasksChangeImage());
  }
}
