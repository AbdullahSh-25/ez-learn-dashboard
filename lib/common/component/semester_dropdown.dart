import '../imports/imports.dart';
import '../widget/custom_reactive_dropdown.dart';

class SemesterDropdown extends StatelessWidget {
  const SemesterDropdown({
    Key? key,
    required this.controlName,
  }) : super(key: key);

  final String controlName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: _buildInputTitle(
        text: 'الفصل الدراسي',
        child: CustomReactiveDropdown(
          controlName: controlName,
          items: const [
            DropdownMenuItem(
              value: 1,
              child: Text('الفصل الأول'),
            ),
            DropdownMenuItem(
              value: 2,
              child: Text('الفصل الثاني'),
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
