import 'package:dio/dio.dart';
import 'package:ez_learn_dashboard/common/constant/app_url.dart';
import 'package:ez_learn_dashboard/common/network/exception/error_handler.dart';

import '../../models/app_users_model.dart';


class AppUsersRemote {
  final Dio _dio;

  const AppUsersRemote({required Dio dio}) : _dio = dio;

  Future<List<AppUsersModel>> getAllAppUsers() {
    return throwDioException(() async {
      final response = await _dio.get(AppUrl.getAllAppUsers);
      return (response.data['response'] as List).map((e) => AppUsersModel.fromJson(e)).toList();
    });
  }
}
