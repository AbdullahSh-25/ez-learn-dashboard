import 'package:ez_learn_dashboard/common/config/theme/colors.dart';
import 'package:ez_learn_dashboard/common/helper/colored_print.dart';
import 'package:ez_learn_dashboard/common/imports/imports.dart';
import 'package:ez_learn_dashboard/common/utils/extension.dart';
import 'package:ez_learn_dashboard/router/inner_router_config.dart';
import 'package:ez_learn_dashboard/router/router_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/app.dart';
import 'bootstarp.dart';
import 'common/config/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  bootstrap(const MyApp());
}



