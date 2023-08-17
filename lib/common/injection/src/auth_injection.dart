import 'package:dio/dio.dart';

import '../../../app/auth/application/auth_facade.dart';
import '../../../app/auth/data/datasources/auth_remote_datasource.dart';
import '../../../app/auth/data/datasources/local/auth_local.dart';
import '../../../app/auth/data/datasources/local/reactive_token_storage.dart';
import '../../../app/auth/data/repositores/auth_repository_impl.dart';
import '../../../app/auth/domain/repositores/auth_repository.dart';
import '../../../app/auth/presentation/state/bloc/auth_bloc.dart';
import '../../utils/storage_service.dart';
import '../injection.dart';

authInjection() {
  getIt.registerSingleton<AuthLocal>(AuthLocal(local: getIt<StorageService<SharedStorage>>()));

  getIt.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSourceImpl(
      dio: getIt<Dio>(),
    ),
  );

  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      remote: getIt<AuthRemoteDataSource>(),
      reactiveTokenStorage: getIt<ReactiveTokenStorage>(),
      storageService: getIt<AuthLocal>(),
    ),
  );

  getIt.registerSingleton<AuthFacade>(
    AuthFacade(remote: getIt<AuthRepository>()),
  );

  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(facade: getIt<AuthFacade>()),
  );
}
