
import 'package:dio/dio.dart';

import '../../../app/app_users/application/app_users_facade.dart';
import '../../../app/app_users/domain/repo/app_users_repo.dart';
import '../../../app/app_users/infrastructure/data_source/remote/app_users_remote.dart';
import '../../../app/app_users/infrastructure/repo_imp/app_users_repo_imp.dart';
import '../../../app/app_users/presentation/state/bloc/app_users_bloc.dart';

import '../injection.dart';

appUsersInjection() async {
  getIt.registerSingleton<AppUsersRemote>(AppUsersRemote(dio: getIt<Dio>()));

  getIt.registerSingleton<AppUsersRepo>(AppUsersRepoImpl(remote: getIt<AppUsersRemote>()));

  getIt.registerSingleton<AppUsersFacade>(AppUsersFacade(repo: getIt<AppUsersRepo>()));

  getIt.registerFactory<AppUsersBloc>(() => AppUsersBloc(facade: getIt<AppUsersFacade>()));
}
