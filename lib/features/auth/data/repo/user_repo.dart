import 'package:finance_ui/core/network/api_helper.dart';
import 'package:finance_ui/core/network/end_points.dart';
import 'package:finance_ui/features/home/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
class UserRepo {
  UserRepo._internal();

  static final UserRepo _instance = UserRepo._init();
  UserRepo._init();

  factory UserRepo() {
    return _instance;
  }

  final UserModel _userModel = UserModel();

  UserModel get userModel => _userModel;

  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, void>> register(
    String username,
    String password,
  ) async {
    try {
      await apiHelper.postRequest(
        endPoint: EndPoints.register,
        data: {'username': username, 'password': password},
      );
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }
      return Left(e.toString());
    }
  }

  Future<Either<String, Response>> login(
    String username,
    String password,
  ) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.login,
        data: {'username': username, 'password': password},
      );
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }
      return Left(e.toString());
    }
  }
}