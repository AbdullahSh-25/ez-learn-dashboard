import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../common/imports/imports.dart';
import '../../../../../common/widget/custom_popup.dart';
import '../../../../../common/widget/custom_reactive_field.dart';
import '../../../../../common/widget/input_title.dart';

class QuizSection extends StatelessWidget {
  final List<String> questions;

  const QuizSection({
    Key? key,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: FormGroup({
        '1': FormControl(),
        '2': FormControl(),
      }),
      child: LayoutBuilder(
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
                        'الاختبارات',
                        style: context.textTheme.headlineSmall,
                      ),
                      // ReactiveFormConsumer(
                      //   builder: (BuildContext context, FormGroup formGroup, Widget? child) {
                      //     return ElevatedButton(
                      //       onPressed: () {
                      //         showCustomPopup(
                      //           context: context,
                      //           confirmText: 'حفظ',
                      //           title: 'معلومات السؤال',
                      //           child: ReactiveForm(
                      //             formGroup: FormGroup({
                      //               '1': FormControl(),
                      //               '2': FormControl(),
                      //             }),
                      //             child: Column(
                      //               children: [
                      //                 const InputTitle(
                      //                   text: 'نص السؤال',
                      //                   child: CustomReactiveField(controlName: '1'),
                      //                 ),
                      //                 const InputTitle(
                      //                   text: 'التلميح',
                      //                   child: CustomReactiveField(controlName: '1'),
                      //                 ),
                      //                 InputTitle(
                      //                   text: 'الإجابات',
                      //                   child: Column(
                      //                     children: [
                      //                       CustomReactiveField(
                      //                         controlName: '1',
                      //                         prefix: InkWell(
                      //                           onTap: () {},
                      //                           child: const Icon(Icons.circle_outlined),
                      //                         ),
                      //                       ),
                      //                       const SizedBox(
                      //                         height: 12,
                      //                       ),
                      //                       CustomReactiveField(
                      //                         controlName: '1',
                      //                         prefix: InkWell(
                      //                           onTap: () {},
                      //                           child: const Icon(Icons.circle_outlined),
                      //                         ),
                      //                       ),
                      //                       const SizedBox(
                      //                         height: 12,
                      //                       ),
                      //                       CustomReactiveField(
                      //                         controlName: '1',
                      //                         prefix: InkWell(
                      //                           onTap: () {},
                      //                           child: const Icon(Icons.check_circle),
                      //                         ),
                      //                       ),
                      //                       const SizedBox(
                      //                         height: 12,
                      //                       ),
                      //                       CustomReactiveField(
                      //                         controlName: '1',
                      //                         prefix: InkWell(
                      //                           onTap: () {},
                      //                           child: const Icon(Icons.circle_outlined),
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //       child: const Text('إضافة اختبار'),
                      //     );
                      //   },
                      // )
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
                              flex: 4,
                              child: Text(
                                'نص السؤال',
                                style: context.textTheme.titleLarge,
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'الخيارات',
                                  style: context.textTheme.titleLarge,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        if (questions.isEmpty)
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 200,
                              ),
                              Text(
                                'لا يوجد اختبارات بعد في هذه المادة',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        for (int i = 0; i < questions.length; i++)
                          Theme(
                            data: context.theme.copyWith(dividerColor: AppColors.transparent),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Text(
                                        questions[i],
                                        // 'تحدث عن البرمجة التفرعية وما هي استراتيجيات الذاكرة فيها تحدث عن البرمجة التفرعية وما هي استراتيجيات الذاكرة فيها تحدث عن البرمجة التفرعية وما هي استراتيجيات الذاكرة فيها تحدث عن البرمجة التفرعية وما هي استراتيجيات الذاكرة فيها',
                                        style: context.textTheme.titleMedium,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              showCustomPopup(
                                                context: context,
                                                confirmText: 'حفظ',
                                                title: 'معلومات السؤال',
                                                child: ReactiveForm(
                                                  formGroup: FormGroup({
                                                    '1': FormControl(),
                                                    '2': FormControl(),
                                                  }),
                                                  child: Column(
                                                    children: [
                                                      const InputTitle(
                                                        text: 'نص السؤال',
                                                        child: CustomReactiveField(controlName: '1'),
                                                      ),
                                                      const InputTitle(
                                                        text: 'التلميح',
                                                        child: CustomReactiveField(controlName: '1'),
                                                      ),
                                                      InputTitle(
                                                        text: 'الإجابات',
                                                        child: Column(
                                                          children: [
                                                            CustomReactiveField(
                                                              controlName: '1',
                                                              prefix: InkWell(
                                                                onTap: () {},
                                                                child: const Icon(Icons.circle_outlined),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 12,
                                                            ),
                                                            CustomReactiveField(
                                                              controlName: '1',
                                                              prefix: InkWell(
                                                                onTap: () {},
                                                                child: const Icon(Icons.circle_outlined),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 12,
                                                            ),
                                                            CustomReactiveField(
                                                              controlName: '1',
                                                              prefix: InkWell(
                                                                onTap: () {},
                                                                child: const Icon(Icons.check_circle),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 12,
                                                            ),
                                                            CustomReactiveField(
                                                              controlName: '1',
                                                              prefix: InkWell(
                                                                onTap: () {},
                                                                child: const Icon(Icons.circle_outlined),
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
                                            style: ElevatedButton.styleFrom(
                                              padding: REdgeInsets.symmetric(horizontal: 8),
                                              side: const BorderSide(color: AppColors.primary),
                                            ),
                                            child: const Text('معاينة'),
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
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
