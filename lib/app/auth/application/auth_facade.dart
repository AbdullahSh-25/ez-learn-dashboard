import 'package:either_dart/either.dart';

import '../domain/entities/signup_param.dart';
import '../domain/entities/user.dart';
import '../domain/entities/user_param.dart';
import '../domain/repositores/auth_repository.dart';


class AuthFacade {
  final AuthRepository _remote;

  AuthFacade({required AuthRepository remote}) : _remote = remote;

  Future<Either<String, User?>> login(UserParam userParam) async => await _remote.login(userParam: userParam);

  Future<Either<String, User>> create({required SignupParam signupParam}) async =>await _remote.create(signupParam: signupParam);
}
