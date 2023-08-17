import 'package:dio/dio.dart';
import 'package:ez_learn_dashboard/common/constant/app_url.dart';
import 'package:ez_learn_dashboard/common/network/exception/error_handler.dart';

import '../../models/dash_users_model.dart';


class DashUsersRemote {
  final Dio _dio;

  const DashUsersRemote({required Dio dio}) : _dio = dio;

  Future<List<DashUsersModel>> getAllDashUsers() {
    return throwDioException(() async {
      final response = await _dio.get(AppUrl.getAllDash);
      return (response.data['response']['dashUsers'] as List).map((e) => DashUsersModel.fromJson(e)).toList();
    });
  }
}
