import 'package:either_dart/either.dart';


import '../entities/signup_param.dart';
import '../entities/user.dart';
import '../entities/user_param.dart';

abstract class AuthRepository {
  AuthRepository();

  Future<Either<String, User>> login({
    required UserParam userParam,
  });

  Future<Either<String, User>> create({
    required SignupParam signupParam,
  });

  Future<bool> logout();
}
