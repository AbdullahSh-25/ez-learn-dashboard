import 'package:ez_learn_dashboard/common/component/semester_dropdown.dart';
import 'package:ez_learn_dashboard/common/component/year_dropdown.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/component/page_bar.dart';
import '../../../../../common/imports/imports.dart';
import '../../../../../common/widget/custom_reactive_dropdown.dart';

class MarksScreen extends StatelessWidget {
  const MarksScreen({Key? key}) : super(key: key);

  static const String pagePath = 'marks';

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return ReactiveForm(
      formGroup: FormGroup({
        '1': FormControl<int>(),
        '2': FormControl<int>(),
        '3': FormControl<String>(),
      }),
      child: PageBar(
        title: 'العلامات',
        buttonText: '',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: _buildInputTitle(
                    text: 'الدفعة',
                    child: const CustomReactiveDropdown(
                      controlName: '3',
                      items: [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('20'),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('21'),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('22'),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('23'),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('24'),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(flex: 2, child: YearDropdown(controlName: '1')),
                const Expanded(flex: 2, child: SemesterDropdown(controlName: '2')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: () {}, child: Text('تطبيق')),
                )
              ],
            ),
            Scrollbar(
              controller: controller,
              child: SingleChildScrollView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('')),
                    DataColumn(label: Text('أمن المعلومات')),
                    DataColumn(label: Text('نظم التشغيل 2')),
                    DataColumn(label: Text('البرمجة التفرعية')),
                    DataColumn(label: Text('نظم رقمية')),
                    DataColumn(label: Text('هندسة البرمجيات 2')),
                    DataColumn(label: Text('إدارة المشاريع')),
                    DataColumn(label: Text('تحليل عددي 2')),
                  ],
                  rows: const [
                    DataRow(
                      cells: [
                        DataCell(Text('عبدالله شيخ دبس')),
                        DataCell(Text('100')),
                        DataCell(Text('50')),
                        DataCell(Text('57')),
                        DataCell(Text('70')),
                        DataCell(Text('90')),
                        DataCell(Text('65')),
                        DataCell(Text('97')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('عبدالله شيخ دبس')),
                        DataCell(Text('100')),
                        DataCell(Text('50')),
                        DataCell(Text('57')),
                        DataCell(Text('70')),
                        DataCell(Text('90')),
                        DataCell(Text('65')),
                        DataCell(Text('97')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('عبدالله شيخ دبس')),
                        DataCell(Text('100')),
                        DataCell(Text('50')),
                        DataCell(Text('57')),
                        DataCell(Text('70')),
                        DataCell(Text('90')),
                        DataCell(Text('65')),
                        DataCell(Text('97')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('عبدالله شيخ دبس')),
                        DataCell(Text('100')),
                        DataCell(Text('50')),
                        DataCell(Text('57')),
                        DataCell(Text('70')),
                        DataCell(Text('90')),
                        DataCell(Text('65')),
                        DataCell(Text('97')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('عبدالله شيخ دبس')),
                        DataCell(Text('100')),
                        DataCell(Text('50')),
                        DataCell(Text('57')),
                        DataCell(Text('70')),
                        DataCell(Text('90')),
                        DataCell(Text('65')),
                        DataCell(Text('97')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputTitle({required String text, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
