import 'package:either_dart/either.dart';

import '../../infrastructure/models/dash_users_model.dart';


abstract class DashUsersRepo {
  Future<Either<String, List<DashUsersModel>>> getAllDashUsers();
}
