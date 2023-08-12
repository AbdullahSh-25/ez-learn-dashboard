import 'package:reactive_forms/reactive_forms.dart';

import '../imports/imports.dart';

class CustomReactiveField extends StatelessWidget {
  final String controlName;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? minLines;
  final int? maxLines;
  final double inputHeight;


  const CustomReactiveField({
    Key? key,
    required this.controlName,
    this.keyboardType,
    this.textInputAction,
    this.minLines,
    this.maxLines,
    this.inputHeight = 36,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: inputHeight,
      child: ReactiveTextField(
        formControlName: controlName,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        minLines: minLines,
        maxLines: maxLines,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
        ),
      ),
    );
  }
}
