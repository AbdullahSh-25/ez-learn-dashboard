import 'package:ez_learn_dashboard/common/utils/converter.dart';
import 'package:ez_learn_dashboard/common/utils/date_time_extension.dart';

import '../../../../../common/component/failed_widget.dart';
import '../../../../../common/component/loading_widget.dart';
import '../../../../../common/imports/imports.dart';
import '../../../../../common/injection/injection.dart';
import '../../../../../common/result_builder/result_builder.dart';
import '../../state/bloc/app_users_bloc.dart';

class AppUsersScreen extends StatelessWidget {
  const AppUsersScreen({Key? key}) : super(key: key);

  static const String pagePath = 'app_users';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppUsersBloc>()..add(GetAllAppUsers()),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text('مستخدمو التطبيق',
              style: context.textTheme.headlineSmall,

            ),
            BlocBuilder<AppUsersBloc, AppUsersState>(builder: (context, state) {
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
                    DataColumn(label: Text('السنة الدراسية')),
                    DataColumn(label: Text('تاريخ الإنشاء')),
                    DataColumn(label: Text('تفاصيل')),
                  ],
                  rows: data
                      .map((e) => DataRow(cells: [
                    DataCell(Text(e.universityId)),
                    DataCell(Text('${e.firstName} ${e.lastName}')),
                    DataCell(Text(yearConverter(e.year))),
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
