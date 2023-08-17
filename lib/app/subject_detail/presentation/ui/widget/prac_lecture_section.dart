import 'package:dotted_border/dotted_border.dart';
import 'package:ez_learn_dashboard/common/utils/date_time_extension.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'dart:html' as html;
import '../../../../../common/imports/imports.dart';
import '../../../../../common/utils/converter.dart';
import '../../../../../common/widget/custom_popup.dart';
import '../../../../../common/widget/custom_reactive_field.dart';
import '../../../../../common/widget/input_title.dart';
import '../../../infrastructure/models/subject_detail_model.dart';
import '../../state/bloc/subject_detail_bloc.dart';

class PracLectureSection extends StatelessWidget {
  final String subjectId;
  final List<LectureModel> lectures;

  const PracLectureSection({
    super.key,
    required this.subjectId,
    required this.lectures,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'محاضرات العملي',
                    style: context.textTheme.headlineSmall,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final bloc = context.read<SubjectDetailBloc>();
                      showCustomPopup(
                        context: context,
                        title: 'محضارة عملي جديدة',
                        onConfirm: () {
                          bloc.add(AddLecture(subjectId, 2));
                        },
                        width: context.screenWidth * 0.3,
                        child: ReactiveForm(
                          formGroup: SubjectDetailBloc.pracLecForm,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const InputTitle(text: 'اسم الملف', child: CustomReactiveField(controlName: 'name')),
                              const InputTitle(
                                text: 'مدة الدراسة المتوقعة (بالدقائق)',
                                child: CustomReactiveField(
                                  controlName: 'description',
                                  keyboardType: TextInputType.multiline,
                                  minLines: 1,
                                  maxLines: 20,
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
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'مدة الدراسة المتوقعة',
                            style: context.textTheme.titleLarge,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'تاريخ الإضافة',
                            style: context.textTheme.titleLarge,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'الخيارات',
                            style: context.textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (lectures.isEmpty)
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 200,
                          ),
                          Text(
                            'لا يوجد محاضرات بعد في هذه المادة',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    for (int i = 0; i < lectures.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Text(
                                  lectures[i].name,
                                  style: context.textTheme.titleMedium,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Text(
                                  lectures[i].expectedPeriod.convertToTime(),
                                  style: context.textTheme.titleMedium,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Text(
                                  lectures[i].dateCreated.toString().date(),
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
                                            buildDocPath(lectures[i].lectureUrl),
                                            // 'https://www2.seas.gwu.edu/~dorpjr/EMSE269/Extra%20Problems/Extra%20Problem%206%20-%20Solving%20Decision%20Trees%20-%20Solution%20Key.pdf',
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
                                          'description': FormControl(),
                                        });
                                        showCustomPopup(
                                          context: context,
                                          title: 'محضارة عملي جديدة',
                                          width: context.screenWidth * 0.3,
                                          child: ReactiveForm(
                                            formGroup: form,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const InputTitle(text: 'اسم الملف', child: CustomReactiveField(controlName: 'name')),
                                                const InputTitle(
                                                  text: 'مدة الدراسة المتوقعة (بالدقائق)',
                                                  child: CustomReactiveField(
                                                    controlName: 'description',
                                                    keyboardType: TextInputType.multiline,
                                                    minLines: 1,
                                                    maxLines: 20,
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
    });
  }
}
