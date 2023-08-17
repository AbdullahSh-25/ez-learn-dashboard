
import 'package:ez_learn_dashboard/common/injection/src/app_user_injection.dart';
import 'package:ez_learn_dashboard/common/injection/src/auth_injection.dart';
import 'package:ez_learn_dashboard/common/injection/src/dash_user_injection.dart';
import 'package:ez_learn_dashboard/common/injection/src/general_injection.dart';
import 'package:ez_learn_dashboard/common/injection/src/subject_detail_injection.dart';
import 'package:ez_learn_dashboard/common/injection/src/subject_injection.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> initInjection() async {
  await generalInjection();
  authInjection();
  subjectInjection();
  subjectDetailInjection();
  dashUsersInjection();
  appUsersInjection();
}
