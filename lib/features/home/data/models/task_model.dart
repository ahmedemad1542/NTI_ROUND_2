import 'package:nti_r2/features/add_task/data/models/category_model.dart';

class TaskModel {
  String? title;
  String? description;
  DateTime? endDate;
  CategoryModel? categoryModel;

  TaskModel({this.title, this.description, this.endDate, this.categoryModel});
}
