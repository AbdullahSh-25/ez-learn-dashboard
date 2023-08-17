import 'package:dio/dio.dart';

import '../../../app/subject_detail/application/subject_detail_facade.dart';
import '../../../app/subject_detail/domain/repo/subject_detail_repo.dart';
import '../../../app/subject_detail/infrastructure/data_source/remote/subject_detail_remote.dart';
import '../../../app/subject_detail/infrastructure/repo_imp/subject_detail_repo_imp.dart';
import '../../../app/subject_detail/presentation/state/bloc/subject_detail_bloc.dart';

import '../injection.dart';

subjectDetailInjection() async {
  getIt.registerSingleton<SubjectDetailRemote>(SubjectDetailRemote(dio: getIt<Dio>()));

  getIt.registerSingleton<SubjectDetailRepo>(SubjectDetailRepoImpl(remote: getIt<SubjectDetailRemote>()));

  getIt.registerSingleton<SubjectDetailFacade>(SubjectDetailFacade(repo: getIt<SubjectDetailRepo>()));

  getIt.registerFactory<SubjectDetailBloc>(() => SubjectDetailBloc(facade: getIt<SubjectDetailFacade>()));
}
