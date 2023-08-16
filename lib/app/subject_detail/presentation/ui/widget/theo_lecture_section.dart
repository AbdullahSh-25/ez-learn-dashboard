import 'package:dotted_border/dotted_border.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'dart:html' as html;
import '../../../../../common/imports/imports.dart';
import '../../../../../common/widget/custom_popup.dart';
import '../../../../../common/widget/custom_reactive_field.dart';
import '../../../../../common/widget/input_title.dart';

class TheoLectureSection extends StatelessWidget {
  const TheoLectureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, cons) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'محاضرات النظري',
                      style: context.textTheme.headlineSmall,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final form = FormGroup({
                          'name': FormControl(),
                          'description': FormControl(validators: [Validators.number, Validators.required]),
                        });
                        showCustomPopup(
                          context: context,
                          title: 'محضارة نظري جديدة',
                          width: context.screenWidth * 0.3,
                          child: ReactiveForm(
                            formGroup: form,
                            child: ReactiveFormConsumer(
                              builder: (context, form, _) => Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const InputTitle(text: 'اسم الملف', child: CustomReactiveField(controlName: 'name')),
                                  InputTitle(
                                    text: 'مدة الدراسة المتوقعة (بالدقائق)',
                                    child: CustomReactiveField(
                                      controlName: 'description',
                                      keyboardType: TextInputType.number,
                                      validation: {
                                        ValidationMessage.number: (val) => 'error',
                                        ValidationMessage.required: (val) => 'required',
                                      },
                                    ),
                                  ),
                                  InputTitle(
                                    text: 'مسار الملف',
                                    child: CustomReactiveField(
                                      controlName: 'description',
                                      readOnly: true,
                                      onTap: (v) {
                                        v.value = 'test';
                                      },
                                      prefix: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        decoration: const BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8),
                                            )),
                                        child: const Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'اختر ملف',
                                              style: TextStyle(color: AppColors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Text('إضافة محاضرة'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: cons.maxWidth,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                            'اسم الملف',
                            style: context.textTheme.titleLarge,
                          )),
                          Expanded(
                              child: Text(
                            'مدة الدراسة المتوقعة',
                            style: context.textTheme.titleLarge,
                          )),
                          Expanded(
                              child: Text(
                            'تاريخ الإضافة',
                            style: context.textTheme.titleLarge,
                          )),
                          Expanded(
                              child: Text(
                            'الخيارات',
                            style: context.textTheme.titleLarge,
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      for (int i = 0; i < 10; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Text(
                                    'المحاضرة الأولى',
                                    style: context.textTheme.titleMedium,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Text(
                                    '1 ساعة و20 دقيقة تقريبا',
                                    style: context.textTheme.titleMedium,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Text(
                                    '2077-8-30',
                                    style: context.textTheme.titleMedium,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          html.window.open(
                                              'https://www2.seas.gwu.edu/~dorpjr/EMSE269/Extra%20Problems/Extra%20Problem%206%20-%20Solving%20Decision%20Trees%20-%20Solution%20Key.pdf',
                                              'New Tab');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: REdgeInsets.symmetric(horizontal: 8),
                                          side: const BorderSide(color: AppColors.primary),
                                        ),
                                        child: const Text('معاينة'),
                                      ),
                                      const Spacer(),
                                      OutlinedButton(
                                        onPressed: () {
                                          final form = FormGroup({
                                            'name': FormControl(),
                                            'description': FormControl(validators: [Validators.number, Validators.required]),
                                          });
                                          showCustomPopup(
                                            context: context,
                                            title: 'محضارة نظري جديدة',
                                            width: context.screenWidth * 0.3,
                                            child: ReactiveForm(
                                              formGroup: form,
                                              child: ReactiveFormConsumer(
                                                builder: (context, form, _) => Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    const InputTitle(text: 'اسم الملف', child: CustomReactiveField(controlName: 'name')),
                                                    InputTitle(
                                                      text: 'مدة الدراسة المتوقعة (بالدقائق)',
                                                      child: CustomReactiveField(
                                                        controlName: 'description',
                                                        keyboardType: TextInputType.number,
                                                        validation: {
                                                          ValidationMessage.number: (val) => 'error',
                                                          ValidationMessage.required: (val) => 'required',
                                                        },
                                                      ),
                                                    ),
                                                    InputTitle(
                                                      text: '',
                                                      child: CustomReactiveField(
                                                        controlName: 'description',
                                                        readOnly: true,
                                                        onTap: (v) {
                                                          v.value = 'test';
                                                        },
                                                        prefix: Container(
                                                          padding: const EdgeInsets.symmetric(horizontal: 16),
                                                          decoration: const BoxDecoration(
                                                              color: AppColors.primary,
                                                              borderRadius: BorderRadius.only(
                                                                topRight: Radius.circular(8),
                                                                bottomRight: Radius.circular(8),
                                                              )),
                                                          child: const Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Text(
                                                                'اختر ملف',
                                                                style: TextStyle(color: AppColors.white),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Text('تعديل'),
                                      ),
                                      const Spacer(),
                                      OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: AppColors.red,
                                          side: const BorderSide(color: AppColors.red),
                                        ),
                                        child: const Text('حذف'),
                                      ),
                                      const Spacer()
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
