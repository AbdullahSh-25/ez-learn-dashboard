import 'package:either_dart/src/either.dart';
import 'package:ez_learn_dashboard/common/network/exception/error_handler.dart';

import '../../domain/repo/dash_users_repo.dart';
import '../data_source/remote/dash_users_remote.dart';
import '../models/dash_users_model.dart';


class DashUsersRepoImpl extends DashUsersRepo {
  final DashUsersRemote _remote;

  DashUsersRepoImpl({required DashUsersRemote remote}) : _remote = remote;

  @override
  Future<Either<String, List<DashUsersModel>>> getAllDashUsers() async {
    return throwAppException(() async {
      final result = await _remote.getAllDashUsers();
      return result;
    });
  }
}
