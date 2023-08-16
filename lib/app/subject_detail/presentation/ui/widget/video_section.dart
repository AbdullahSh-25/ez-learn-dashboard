import 'package:reactive_forms/reactive_forms.dart';
import 'dart:html' as html;
import '../../../../../common/imports/imports.dart';
import '../../../../../common/widget/custom_popup.dart';
import '../../../../../common/widget/custom_reactive_field.dart';
import '../../../../../common/widget/input_title.dart';

class VideosSection extends StatelessWidget {
  const VideosSection({Key? key}) : super(key: key);

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
                    'الفيديوهات',
                    style: context.textTheme.headlineSmall,
                  ),
                  ElevatedButton(
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
                              const InputTitle(text: 'عنوان الفيديو', child: CustomReactiveField(controlName: 'name')),
                              const InputTitle(
                                text: 'مدة الفيديو',
                                child: CustomReactiveField(
                                  controlName: 'description',
                                  keyboardType: TextInputType.multiline,
                                  minLines: 1,
                                  maxLines: 20,
                                ),
                              ),
                              InputTitle(
                                text: 'رابط الفيديو',
                                child: CustomReactiveField(
                                  controlName: 'description',
                                  readOnly: true,
                                  onTap: (v) {
                                    v.value = 'test';
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: const Text('إضافة فيديو'),
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
                              'عنوان الفيديو',
                              style: context.textTheme.titleLarge,
                            )),
                        Expanded(
                            child: Text(
                              'مدة الفيديو',
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
                                    'Introduction to \'Habed\'ovia',
                                    style: context.textTheme.titleMedium,
                                  ),
                                )),
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Text(
                                    '1 ساعة و20 دقيقة',
                                    style: context.textTheme.titleMedium,
                                  ),
                                )),
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
                                        html.window.open('https://youtu.be/Be9UH1kXFDw', 'name');
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
                                                  const InputTitle(text: 'عنوان الفيديو', child: CustomReactiveField(controlName: 'name')),
                                                  const InputTitle(
                                                    text: 'مدة الفيديو',
                                                    child: CustomReactiveField(
                                                      controlName: 'description',
                                                      keyboardType: TextInputType.multiline,
                                                      minLines: 1,
                                                      maxLines: 20,
                                                    ),
                                                  ),
                                                  InputTitle(
                                                    text: 'رابط الفيديو',
                                                    child: CustomReactiveField(
                                                      controlName: 'description',
                                                      readOnly: true,
                                                      onTap: (v) {
                                                        v.value = 'test';
                                                      },
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
