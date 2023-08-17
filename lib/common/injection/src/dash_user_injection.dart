
import 'package:dio/dio.dart';

import '../../../app/dash_users/application/dash_users_facade.dart';
import '../../../app/dash_users/domain/repo/dash_users_repo.dart';
import '../../../app/dash_users/infrastructure/data_source/remote/dash_users_remote.dart';
import '../../../app/dash_users/infrastructure/repo_imp/dash_users_repo_imp.dart';


import '../../../app/dash_users/presentation/state/bloc/dash_users_bloc.dart';
import '../injection.dart';

dashUsersInjection() async {
  getIt.registerSingleton<DashUsersRemote>(DashUsersRemote(dio: getIt<Dio>()));

  getIt.registerSingleton<DashUsersRepo>(DashUsersRepoImpl(remote: getIt<DashUsersRemote>()));

  getIt.registerSingleton<DashUsersFacade>(DashUsersFacade(repo: getIt<DashUsersRepo>()));

  getIt.registerFactory<DashUsersBloc>(() => DashUsersBloc(facade: getIt<DashUsersFacade>()));
}
