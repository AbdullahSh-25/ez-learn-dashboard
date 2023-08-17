import 'package:dio/dio.dart';
import 'package:ez_learn_dashboard/app/subject_detail/domain/entities/lecture_param.dart';
import 'package:ez_learn_dashboard/common/constant/app_url.dart';
import 'package:ez_learn_dashboard/common/network/exception/error_handler.dart';

import '../../models/subject_detail_model.dart';


class SubjectDetailRemote {
  final Dio _dio;

  const SubjectDetailRemote({required Dio dio}) : _dio = dio;

  Future<SubjectDetailModel> getSubjectById(String subjectId) {
    return throwDioException(() async {
      final response = await _dio.get(AppUrl.getSubjectById,queryParameters: {'Id':subjectId});
      return SubjectDetailModel.fromJson(response.data['response']);
    });
  }

  Future<LectureModel> addLecture(LectureParam param) {
    return throwDioException(() async {
      final response = await _dio.post(AppUrl.addLecture,
      data: FormData.fromMap(param.toJson()));
      return LectureModel.fromJson(response.data['response']);
    });
  }
}
