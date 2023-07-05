import 'package:reactive_forms/reactive_forms.dart';

import '../imports/imports.dart';

class CustomReactiveField extends StatelessWidget {
  final String controlName;

  const CustomReactiveField({
    Key? key,
    required this.controlName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ReactiveTextField(
        formControlName: controlName,
        decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 8)) ,

      ),
    );
  }
}
