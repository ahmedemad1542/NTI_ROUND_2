import 'package:finance_ui/features/Tasks/data/model/category_model.dart';

class TaskModel {
  String? title;
  String? description;
  String? group  ;
  DateTime? endDate ;
  CategoryModel? categoryModel;

  TaskModel({
    required this.title,
    required this.description,
    required this.group,
    required this.endDate,
    required this.categoryModel,
  });
}
