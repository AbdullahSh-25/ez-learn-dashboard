import 'package:either_dart/either.dart';
import 'package:ez_learn_dashboard/app/subject_detail/domain/entities/lecture_param.dart';

import '../../infrastructure/models/subject_detail_model.dart';


abstract class SubjectDetailRepo {
  Future<Either<String, SubjectDetailModel>> getSubjectById(String subjectId);
  Future<Either<String, LectureModel>> addLecture(LectureParam param);
}
