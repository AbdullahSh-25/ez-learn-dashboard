import 'package:ez_learn_dashboard/app/dash_users/presentation/state/bloc/dash_users_bloc.dart';
import 'package:ez_learn_dashboard/common/component/failed_widget.dart';
import 'package:ez_learn_dashboard/common/component/loading_widget.dart';
import 'package:ez_learn_dashboard/common/injection/injection.dart';
import 'package:ez_learn_dashboard/common/utils/date_time_extension.dart';

import '../../../../../common/imports/imports.dart';
import '../../../../../common/result_builder/result_builder.dart';

class DashUsersScreen extends StatelessWidget {
  const DashUsersScreen({Key? key}) : super(key: key);

  static const String pagePath = 'dash_users';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DashUsersBloc>()..add(GetAllDashUsers()),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'مستخدمو اللوحة',
              style: context.textTheme.headlineSmall,
            ),
            BlocBuilder<DashUsersBloc, DashUsersState>(builder: (context, state) {
              return ResultBuilder(
                result: state.result,
                init: () => const SizedBox(),
                loading: () => const LoadingWidget(),
                error: (error) => FailedWidget(
                  error: error,
                  onPressed: () {},
                ),
                success: (data) => DataTable(
                  columns: const [
                    DataColumn(label: Text('الرقم الجامعي')),
                    DataColumn(label: Text('الاسم')),
                    DataColumn(label: Text('البريد الالكتروني')),
                    DataColumn(label: Text('الصلاحيات')),
                    DataColumn(label: Text('تاريخ الإنشاء')),
                    DataColumn(label: Text('تفاصيل')),
                  ],
                  rows: data
                      .map((e) => DataRow(cells: [
                            DataCell(Text(e.universityId)),
                            DataCell(Text('${e.firstName} ${e.lastName}')),
                            DataCell(Text(e.email)),
                            DataCell(Text(e.role.join(' , '))),
                            DataCell(Text(e.dateCreated.toString().date())),
                            DataCell(Icon(Icons.more_horiz)),
                          ]))
                      .toList(),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
