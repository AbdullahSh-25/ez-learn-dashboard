import 'package:either_dart/either.dart';

import '../domain/repo/_repo.dart';
import '../infrastructure/models/_model.dart';


class Facade {
  final Repo _repo;

  const Facade({required Repo repo}) : _repo = repo;

  Future<Either<String,Model>> getAllSubject() async {
    return await _repo.getAllSubject();
  }
}
