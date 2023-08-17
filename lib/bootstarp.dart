import 'package:ez_learn_dashboard/common/helper/app_bloc_observer.dart';
import 'package:ez_learn_dashboard/common/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/helper/colored_print.dart';

bootstrap(Widget mainApp) {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      try {} catch (e, s) {
        printR(e);
        printR(s);
      } finally  {
        await initInjection();
        runApp(mainApp);
      }
    },
    blocObserver: AppBlocObserver(),
  );
}
