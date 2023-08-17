import 'package:either_dart/either.dart';

import '../../infrastructure/models/subject_model.dart';
import '../entities/subject_param.dart';

abstract class SubjectRepo {
  Future<Either<String, List<SubjectModel>>> getAllSubject();
  Future<Either<String, SubjectModel>> addSubject(SubjectParam param);
}
