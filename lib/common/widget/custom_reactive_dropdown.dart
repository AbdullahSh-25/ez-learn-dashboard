import 'package:reactive_forms/reactive_forms.dart';

import '../imports/imports.dart';

class CustomReactiveDropdown extends StatelessWidget {
  final String controlName;
  final List<DropdownMenuItem> items;

  const CustomReactiveDropdown({
    Key? key,
    required this.controlName,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ReactiveDropdownField(
        items: items,
        decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 8)),
        formControlName: controlName,
      ),
    );
  }
}
