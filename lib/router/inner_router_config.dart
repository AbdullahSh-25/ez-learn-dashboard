import 'package:beamer/beamer.dart';
import 'package:ez_learn_dashboard/app/notification/presentation/ui/screen/notification_screen.dart';
import 'package:ez_learn_dashboard/app/subject_detail/presentation/ui/screen/subject_detail_screen.dart';

import '../app/subjects/presentation/ui/screen/subjects_screen.dart';
import '../common/imports/imports.dart';

class InnerRouterConfig {
  late final BeamerDelegate router;
  final GlobalKey<BeamerState> _key;

  InnerRouterConfig(this._key) {
    router = BeamerDelegate(
      transitionDelegate: const NoAnimationTransitionDelegate(),
      initialPath: '/second',
      locationBuilder: RoutesLocationBuilder(
        routes: {
          '/first': (context, state, data) => BeamPage(
              key: const ValueKey('first'),
              title: 'First',
              child: Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('مستخدمو التطبيق'),
                    DataTable(
                        columns: const [
                      DataColumn(label: Text('#')),
                      DataColumn(label: Text('الاسم')),
                      DataColumn(label: Text('الرقم الجامعي')),
                      DataColumn(label: Text('السنة الدراسية')),
                      DataColumn(label: Text('تاريخ الإنشاء')),
                      DataColumn(label: Text('تفاصيل')),
                    ], rows: [
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('عبدالله شيخ دبس')),
                        DataCell(Text('4910')),
                        DataCell(Text('الرابعة')),
                        DataCell(Text('2023/7/5 3:17AM')),
                        DataCell(Icon(Icons.more_horiz)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('عبدالله شيخ دبس')),
                        DataCell(Text('4910')),
                        DataCell(Text('الرابعة')),
                        DataCell(Text('2023/7/5 3:17AM')),
                        DataCell(Icon(Icons.more_horiz)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('عبدالله شيخ دبس')),
                        DataCell(Text('4910')),
                        DataCell(Text('الرابعة')),
                        DataCell(Text('2023/7/5 3:17AM')),
                        DataCell(Icon(Icons.more_horiz)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('عبدالله شيخ دبس')),
                        DataCell(Text('4910')),
                        DataCell(Text('الرابعة')),
                        DataCell(Text('2023/7/5 3:17AM')),
                        DataCell(Icon(Icons.more_horiz)),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('عبدالله شيخ دبس')),
                        DataCell(Text('4910')),
                        DataCell(Text('الرابعة')),
                        DataCell(Text('2023/7/5 3:17AM')),
                        DataCell(Icon(Icons.more_horiz)),
                      ]),
                    ]),
                  ],
                ),
              )),
          '/second': (context, state, data) => BeamPage(
              title: 'Second',
              key: const ValueKey('second'),
              child: SubjectsScreen(router: router,)),
          '/second/subject_detail': (context, state, data) => BeamPage(
              title: 'Subject Detail',
              key: const ValueKey('subject_detail'),
              child: SubjectDetailScreen(router: router,)),
        },
      ),
    );
  }
}
