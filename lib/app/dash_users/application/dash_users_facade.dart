import 'package:either_dart/either.dart';

import '../domain/repo/dash_users_repo.dart';
import '../infrastructure/models/dash_users_model.dart';


class DashUsersFacade {
  final DashUsersRepo _repo;

  const DashUsersFacade({required DashUsersRepo repo}) : _repo = repo;

  Future<Either<String,List<DashUsersModel>>> getAllDashUsers() async {
    return await _repo.getAllDashUsers();
  }
}
