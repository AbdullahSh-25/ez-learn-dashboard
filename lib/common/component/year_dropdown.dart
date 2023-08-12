import '../imports/imports.dart';
import '../widget/custom_reactive_dropdown.dart';
import '../widget/input_title.dart';

class YearDropdown extends StatelessWidget {
  const YearDropdown({
    Key? key,
    required this.controlName,
  }) : super(key: key);

  final String controlName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: _buildInputTitle(
        text: 'السنة الدراسية',
        child: CustomReactiveDropdown(
          controlName: controlName,
          items: const [
            DropdownMenuItem(
              value: 1,
              child: Text('السنة الأولى'),
            ),
            DropdownMenuItem(
              value: 2,
              child: Text('السنة الثانية'),
            ),
            DropdownMenuItem(
              value: 3,
              child: Text('السنة الثالثة'),
            ),
            DropdownMenuItem(
              value: 4,
              child: Text('السنة الرابعة'),
            ),
            DropdownMenuItem(
              value: 5,
              child: Text('السنة الخامسة'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputTitle({required String text, required Widget child}) {
    return InputTitle(
      text: text,
      child: child,
    );
  }
}

