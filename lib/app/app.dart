
import 'package:bot_toast/bot_toast.dart';

import '../common/config/theme/theme.dart';
import '../common/imports/imports.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final BRouterConfig router;

  @override
  void initState() {
    router = BRouterConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(1700, 835),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        routerDelegate: router.router,
        routeInformationParser: BeamerParser(),
        builder: (context, child) {
          child = BotToastInit()(context,child);
          return Directionality(textDirection: TextDirection.rtl, child: child);
        },
      ),
    );
  }
}
