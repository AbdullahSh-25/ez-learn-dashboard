import 'package:either_dart/either.dart';

import '../domain/repo/app_users_repo.dart';
import '../infrastructure/models/app_users_model.dart';


class AppUsersFacade {
  final AppUsersRepo _repo;

  const AppUsersFacade({required AppUsersRepo repo}) : _repo = repo;

  Future<Either<String,List<AppUsersModel>>> getAllAppUsers() async {
    return await _repo.getAllAppUsers();
  }
}
