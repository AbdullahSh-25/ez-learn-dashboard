import 'package:either_dart/src/either.dart';
import 'package:ez_learn_dashboard/app/subject_detail/domain/entities/lecture_param.dart';
import 'package:ez_learn_dashboard/common/network/exception/error_handler.dart';

import '../../domain/repo/subject_detail_repo.dart';
import '../data_source/remote/subject_detail_remote.dart';
import '../models/subject_detail_model.dart';


class SubjectDetailRepoImpl extends SubjectDetailRepo {
  final SubjectDetailRemote _remote;

  SubjectDetailRepoImpl({required SubjectDetailRemote remote}) : _remote = remote;

  @override
  Future<Either<String, SubjectDetailModel>> getSubjectById(String subjectId) async {
    return throwAppException(() async {
      final result = await _remote.getSubjectById(subjectId);
      return result;
    });
  }

  @override
  Future<Either<String, LectureModel>> addLecture(LectureParam param) async {
    return throwAppException(() async {
      final result = await _remote.addLecture(param);
      return result;
    });
  }

}
