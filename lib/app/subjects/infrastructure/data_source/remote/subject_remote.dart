import 'package:dio/dio.dart';
import 'package:ez_learn_dashboard/app/subjects/domain/entities/subject_param.dart';
import 'package:ez_learn_dashboard/common/constant/app_url.dart';
import 'package:ez_learn_dashboard/common/network/exception/error_handler.dart';

import '../../models/subject_model.dart';

class SubjectRemote {
  final Dio _dio;

  const SubjectRemote({required Dio dio}) : _dio = dio;

  Future<List<SubjectModel>> getAllSubject() {
    return throwDioException(() async {
      final response = await _dio.get(AppUrl.getAllSubject);
      return (response.data['response'] as List).map((e) => SubjectModel.fromJson(e)).toList();
    });
  }

  Future<SubjectModel> addSubject(SubjectParam param) {
    return throwDioException(() async {
      final response = await _dio.post(AppUrl.addSubject,data: FormData.fromMap(param.toJson()));
      return SubjectModel.fromJson(response.data['response']);
    });
  }

}
