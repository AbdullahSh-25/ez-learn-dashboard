import 'package:reactive_forms/reactive_forms.dart';

import '../imports/imports.dart';

class CustomReactiveField extends StatelessWidget {
  final String controlName;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? minLines;
  final int? maxLines;
  final Widget? prefix;
  final double inputHeight;
  final bool readOnly;
  final ReactiveFormFieldCallback? onTap;
  final Map<String, ValidationMessageFunction>? validation;


  const CustomReactiveField({
    Key? key,
    required this.controlName,
    this.keyboardType,
    this.textInputAction,
    this.minLines,
    this.maxLines,
    this.prefix,
    this.inputHeight = 36,
    this.readOnly = false,
    this.onTap,
    this.validation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: inputHeight,
      child: ReactiveTextField(
        formControlName: controlName,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        readOnly: readOnly,
        onTap: onTap,
        minLines: minLines,
        maxLines: maxLines,
        validationMessages: validation,
        decoration:  InputDecoration(
          prefixIcon: prefix,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
        ),
      ),
    );
  }
}
