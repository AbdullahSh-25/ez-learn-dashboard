import 'package:ez_learn_dashboard/app/subject_detail/presentation/state/bloc/subject_detail_bloc.dart';
import 'package:ez_learn_dashboard/common/utils/date_time_extension.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'dart:html' as html;
import '../../../../../common/imports/imports.dart';
import '../../../../../common/widget/custom_popup.dart';
import '../../../../../common/widget/custom_reactive_field.dart';
import '../../../../../common/widget/input_title.dart';
import '../../../infrastructure/models/subject_detail_model.dart';

class VideosSection extends StatelessWidget {
  final List<VideoModel> videos;

  const VideosSection({
    Key? key,
    required this.videos,
  }) : super(key: key);

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
                      final bloc = context.read<SubjectDetailBloc>();

                      showCustomPopup(
                        context: context,
                        title: 'محضارة عملي جديدة',
                        onConfirm: (){
                          // bloc.add(AddLecture(subjectId, 2));
                        },
                        width: context.screenWidth * 0.3,
                        child: ReactiveForm(
                          formGroup: SubjectDetailBloc.videoForm,
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
                    if (videos.isEmpty)
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 200,
                          ),
                          Text(
                            'لا يوجد فيديوهات بعد في هذه المادة',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    for (int i = 0; i < videos.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Text(
                                  videos[i].videoName,
                                  style: context.textTheme.titleMedium,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Text(
                                  videos[i].duration.convertToTime(),
                                  style: context.textTheme.titleMedium,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Text(
                                  videos[i].dateCreated.toString().date(),
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
