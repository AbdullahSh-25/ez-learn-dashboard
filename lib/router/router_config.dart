import 'package:ez_learn_dashboard/common/imports/imports.dart';
import 'package:ez_learn_dashboard/main.dart';

import '../app/root/presentation/ui/screen/root_screen.dart';

typedef BeamerBuilder = dynamic Function(BuildContext context, BeamState state, Object? data);

class BRouterConfig {
  late final BeamerDelegate router;

  BRouterConfig() {
    router = BeamerDelegate(
      // initialPath: '/',
      locationBuilder: RoutesLocationBuilder(
        routes: {
          '/*': MyHomePage.pageBuilder,
        },
      ),
    );
  }
}

