import 'package:either_dart/either.dart';

import '../../infrastructure/models/_model.dart';


abstract class Repo {
  Future<Either<String, Model>> getAllSubject();
}
