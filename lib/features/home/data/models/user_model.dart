import 'package:finance_ui/features/home/data/models/task_model.dart';
import 'package:image_picker/image_picker.dart';

class UserModel
{
  String? userName;
  String? password;
  XFile? image;
  List<TaskModel>? tasks;
  String? authToken;
  String? refreshToken;

  UserModel({this.userName, this.image, this.password, this.tasks});
}