import 'package:dio/dio.dart';
import 'package:ez_learn_dashboard/common/constant/app_url.dart';
import 'package:ez_learn_dashboard/common/network/exception/error_handler.dart';

import '../../models/_model.dart';


class Remote {
  final Dio _dio;

  const Remote({required Dio dio}) : _dio = dio;

  Future<Model> getAllSubject() {
    return throwDioException(() async {
      final response = await _dio.get(AppUrl.getAllSubject);
      return Model.fromJson(response.data['response']);
    });
  }
}
