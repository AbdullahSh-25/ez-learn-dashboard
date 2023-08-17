import 'package:either_dart/src/either.dart';
import 'package:ez_learn_dashboard/common/network/exception/error_handler.dart';

import '../../domain/repo/_repo.dart';
import '../data_source/remote/_remote.dart';
import '../models/_model.dart';


class RepoImpl extends Repo {
  final Remote _remote;

  RepoImpl({required Remote remote}) : _remote = remote;

  @override
  Future<Either<String, Model>> getAllSubject() async {
    return throwAppException(() async {
      final result = await _remote.getAllSubject();
      return result;
    });
  }
}
