import '../../../../../common/imports/imports.dart';

class DashUsersScreen extends StatelessWidget {
  const DashUsersScreen({Key? key}) : super(key: key);

  static const String pagePath = 'dash_users';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('مستخدمو اللوحة'),
          DataTable(
              columns: const [
                DataColumn(label: Text('#')),
                DataColumn(label: Text('الاسم')),
                DataColumn(label: Text('الرقم الجامعي')),
                DataColumn(label: Text('السنة الدراسية')),
                DataColumn(label: Text('تاريخ الإنشاء')),
                DataColumn(label: Text('تفاصيل')),
              ], rows: const [
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
    );
  }
}
