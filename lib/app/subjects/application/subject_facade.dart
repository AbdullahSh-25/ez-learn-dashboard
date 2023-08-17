import 'package:either_dart/either.dart';

import '../domain/entities/subject_param.dart';
import '../domain/repo/subject_repo.dart';
import '../infrastructure/models/subject_model.dart';

class SubjectFacade {
  final SubjectRepo _repo;

  const SubjectFacade({required SubjectRepo repo}) : _repo = repo;

  Future<Either<String,List<SubjectModel>>> getAllSubject() async {
    return await _repo.getAllSubject();
  }

  Future<Either<String,SubjectModel>> addSubject(SubjectParam param) async {
    return await _repo.addSubject(param);
  }
}
