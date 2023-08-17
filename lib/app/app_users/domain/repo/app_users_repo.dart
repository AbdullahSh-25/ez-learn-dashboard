import 'package:either_dart/either.dart';

import '../../infrastructure/models/app_users_model.dart';


abstract class AppUsersRepo {
  Future<Either<String, List<AppUsersModel>>> getAllAppUsers();
}
