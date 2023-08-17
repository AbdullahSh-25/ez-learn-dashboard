import 'package:dio/dio.dart';


import '../../../../common/constant/app_url.dart';
import '../../../../common/network/exception/error_handler.dart';
import '../../domain/entities/signup_param.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/user_param.dart';

abstract class AuthRemoteDataSource {
  Future<User?> login({required UserParam userParam});
  Future<User?> createUser({required SignupParam signupParam});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;
  AuthRemoteDataSourceImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<User?> login({required UserParam userParam}) {
    return throwDioException(() async {
      final response = await _dio.post(
        AppUrl.login,
        data: userParam.toMap(),
      );
      return User.fromMap(response.data['response']);
    });
  }

  @override
  Future<User?> createUser({required SignupParam signupParam}) {
    return throwDioException(() async {
      final response = await _dio.post(
        AppUrl.create,
        data: signupParam.toMap(),
      );
      return User.fromMap(response.data['response']);
    });
  }
}
