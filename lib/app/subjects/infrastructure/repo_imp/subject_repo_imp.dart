import 'package:either_dart/either.dart';
import 'package:ez_learn_dashboard/app/subjects/domain/repo/subject_repo.dart';
import 'package:ez_learn_dashboard/app/subjects/infrastructure/data_source/remote/subject_remote.dart';
import 'package:ez_learn_dashboard/common/network/exception/error_handler.dart';

import '../../domain/entities/subject_param.dart';
import '../models/subject_model.dart';

class SubjectRepoImpl extends SubjectRepo {
  final SubjectRemote _remote;

  SubjectRepoImpl({required SubjectRemote remote}) : _remote = remote;

  @override
  Future<Either<String, List<SubjectModel>>> getAllSubject() async {
    return throwAppException(() async {
      final result = await _remote.getAllSubject();
      return result;
    });
  }
  @override
  Future<Either<String, SubjectModel>> addSubject(SubjectParam param) async {
    return throwAppException(() async {
      final result = await _remote.addSubject(param);
      return result;
    });
  }

}
