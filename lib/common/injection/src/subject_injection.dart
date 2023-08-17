import 'package:dio/dio.dart';
import 'package:ez_learn_dashboard/app/subjects/domain/repo/subject_repo.dart';
import 'package:ez_learn_dashboard/app/subjects/infrastructure/data_source/remote/subject_remote.dart';
import 'package:ez_learn_dashboard/app/subjects/infrastructure/repo_imp/subject_repo_imp.dart';

import '../../../app/subjects/application/subject_facade.dart';
import '../../../app/subjects/presentation/state/bloc/subject_bloc.dart';

import '../injection.dart';

subjectInjection() async {
  getIt.registerSingleton<SubjectRemote>(SubjectRemote(dio: getIt<Dio>()));

  getIt.registerSingleton<SubjectRepo>(SubjectRepoImpl(remote: getIt<SubjectRemote>()));

  getIt.registerSingleton<SubjectFacade>(SubjectFacade(repo: getIt<SubjectRepo>()));

  getIt.registerFactory<SubjectBloc>(() => SubjectBloc(facade: getIt<SubjectFacade>()));
}
