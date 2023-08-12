import 'package:ez_learn_dashboard/app/app_users/presentation/ui/screen/app_users_screen.dart';
import 'package:ez_learn_dashboard/app/marks/presentation/ui/screen/marks_screen.dart';
import 'package:ez_learn_dashboard/app/notification/presentation/ui/screen/notification_screen.dart';
import 'package:ez_learn_dashboard/app/subject_detail/presentation/ui/screen/subject_detail_screen.dart';

import '../app/dash_users/presentation/ui/screen/dash_users_screen.dart';
import '../app/subjects/presentation/ui/screen/subjects_screen.dart';
import '../common/imports/imports.dart';

class InnerRouterConfig {
  late final BeamerDelegate router;

  InnerRouterConfig() {
    router = BeamerDelegate(
      transitionDelegate: const NoAnimationTransitionDelegate(),
      initialPath: '/subjects',
      routeListener: (routeInformation, delegate) {
        printW('Inner Router ${routeInformation.location}');
      },
      locationBuilder: RoutesLocationBuilder(
        routes: {
          '/subjects': (context, state, data) => BeamPage(
              title: 'Subjects',
              key: const ValueKey('subjects'),
              child: SubjectsScreen(router: router,)),
          '/subjects/subject_detail': (context, state, data) => BeamPage(
              title: 'Subject Detail',
              key: const ValueKey('subject_detail'),
              child: SubjectDetailScreen(router: router,)),
          '/marks': (context, state, data) => const BeamPage(
              title: 'Marks',
              key: ValueKey('marks'),
              child: MarksScreen()),
          '/notification': (context, state, data) => const BeamPage(
              title: 'Notification',
              key: ValueKey('notification'),
              child: NotificationScreen()),
          '/app_users': (context, state, data) => const BeamPage(
              title: 'App Users',
              key: ValueKey('app_users'),
              child: AppUsersScreen()),
          '/dash_users': (context, state, data) => const BeamPage(
              title: 'Dash Users',
              key: ValueKey('dash_users'),
              child: DashUsersScreen()),
        },
      ),
    );
  }
}
