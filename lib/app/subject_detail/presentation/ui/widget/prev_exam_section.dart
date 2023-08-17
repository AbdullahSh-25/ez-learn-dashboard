import 'package:dotted_border/dotted_border.dart';
import 'package:ez_learn_dashboard/app/subject_detail/infrastructure/models/subject_detail_model.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'dart:html' as html;
import '../../../../../common/imports/imports.dart';
import '../../../../../common/utils/converter.dart';
import '../../../../../common/widget/custom_popup.dart';
import '../../../../../common/widget/custom_reactive_field.dart';
import '../../../../../common/widget/input_title.dart';

class PrevExamSection extends StatelessWidget {
  final List<PrevExamModel> prevExams;

  const PrevExamSection({
    Key? key,
    required this.prevExams,
  }) : super(key: key);

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
                      'أسئلة الدورات',
                      style: context.textTheme.headlineSmall,
                    ),
                    ReactiveFormConsumer(
                      builder: (BuildContext context, FormGroup formGroup, Widget? child) {
                        return ElevatedButton(
                          onPressed: () {
                            final form = FormGroup({
                              'name': FormControl(),
                              'description': FormControl(validators: [Validators.number, Validators.required]),
                            });
                            showCustomPopup(
                              context: context,
                              title: 'معلومات الملف',
                              width: context.screenWidth * 0.3,
                              child: ReactiveForm(
                                formGroup: form,
                                child: ReactiveFormConsumer(
                                  builder: (context, form, _) => Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const InputTitle(text: 'اسم الملف', child: CustomReactiveField(controlName: 'name')),
                                      InputTitle(
                                        text: 'اسم الدكتور',
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
                          child: const Text('إضافة دورة'),
                        );
                      },
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
                            'الدورة الامتحانية',
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
                      if (prevExams.isEmpty)
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 200,
                            ),
                            Text(
                              'لا يوجد دورات بعد في هذه المادة',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      for (int i = 0; i < prevExams.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Text(
                                    prevExams[i].name,
                                    style: context.textTheme.titleMedium,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Text(
                                    '${prevExams[i].year} - ${getTerm(prevExams[i].term)}',
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
                                          html.window.open(buildDocPath(prevExams[i].pdfUrl), 'New Tab');
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
                                            title: 'معلومات الملف',
                                            width: context.screenWidth * 0.3,
                                            child: ReactiveForm(
                                              formGroup: form,
                                              child: ReactiveFormConsumer(
                                                builder: (context, form, _) => Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    const InputTitle(text: 'اسم الملف', child: CustomReactiveField(controlName: 'name')),
                                                    InputTitle(
                                                      text: 'اسم الدكتور',
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
                        )
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

  getTerm(int term) {
    switch (term) {
      case 1:
        return 'الدورة الأولى';
      case 2:
        return ' الدورة الثانية';
      default:
        return 'الدورة التكميلية';
    }
  }
}
