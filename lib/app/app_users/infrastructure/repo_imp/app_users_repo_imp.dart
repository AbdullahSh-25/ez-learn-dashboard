import 'package:either_dart/src/either.dart';
import 'package:ez_learn_dashboard/common/network/exception/error_handler.dart';

import '../../domain/repo/app_users_repo.dart';
import '../data_source/remote/app_users_remote.dart';
import '../models/app_users_model.dart';


class AppUsersRepoImpl extends AppUsersRepo {
  final AppUsersRemote _remote;

  AppUsersRepoImpl({required AppUsersRemote remote}) : _remote = remote;

  @override
  Future<Either<String, List<AppUsersModel>>> getAllAppUsers() async {
    return throwAppException(() async {
      final result = await _remote.getAllAppUsers();
      return result;
    });
  }
}
