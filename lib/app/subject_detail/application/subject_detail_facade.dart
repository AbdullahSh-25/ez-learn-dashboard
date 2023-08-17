import 'package:either_dart/either.dart';

import '../domain/entities/lecture_param.dart';
import '../domain/repo/subject_detail_repo.dart';
import '../infrastructure/models/subject_detail_model.dart';

class SubjectDetailFacade {
  final SubjectDetailRepo _repo;

  const SubjectDetailFacade({required SubjectDetailRepo repo}) : _repo = repo;

  Future<Either<String, SubjectDetailModel>> getSubjectById(String subjectId) async {
    return await _repo.getSubjectById(subjectId);
  }

  Future<Either<String, LectureModel>> addLecture(LectureParam param) async {
    return await _repo.addLecture(param);
  }
}
