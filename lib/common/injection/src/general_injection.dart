import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/auth/data/datasources/local/reactive_token_storage.dart';
import '../../constant/app_url.dart';
import '../../network/dio_client.dart';
import '../../utils/storage_service.dart';
import '../injection.dart';

Future<void> generalInjection() async {
  getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());

  getIt.registerSingleton<StorageService<SharedStorage>>(StorageService.shared(getIt<SharedPreferences>()));

  getIt.registerSingleton<ReactiveTokenStorage>(ReactiveTokenStorage(getIt<StorageService<SharedStorage>>()));

  getIt.registerSingleton<Dio>(DioClient("${AppUrl.baseUrlDevelopment}api/"));
}
