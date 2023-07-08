

import 'package:ez_learn_dashboard/app/root/presentation/ui/widget/sidebar.dart';

import '../../../../../common/imports/imports.dart';
import '../../../../../router/inner_router_config.dart';

class Navigator{

}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  static const String pagePath = '/';
  static BeamerBuilder pageBuilder = (context, state, data) {
    return BeamPage(key: ValueKey('home${DateTime.now()}'), title: 'Home', child: const MyHomePage(title: 'title'));
  };

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _beamerKey = GlobalKey<BeamerState>();

  late final InnerRouterConfig router;

  @override
  void initState() {
    router = InnerRouterConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Sidebar(beamerKey: _beamerKey,router: router.router),
              Expanded(
                child: Padding(
                  padding: REdgeInsets.only(top: 150),
                  child: Beamer(
                    key: _beamerKey,
                    routerDelegate: router.router,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: context.screenWidth * 0.17,
            child: Container(
              margin: REdgeInsets.symmetric(vertical: 32,horizontal: 40),
              padding: REdgeInsets.symmetric(vertical: 8,horizontal: 40),
              height: 80.r,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(-1, 1), // changes position of shadow
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('أهلاً عبدالله'),
                  SizedBox(width: 16,),
                  Container(
                    padding: REdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary.withOpacity(0.3),
                    ),
                    child: Icon(Icons.person_outline),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}