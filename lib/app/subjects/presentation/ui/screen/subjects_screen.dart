import 'dart:typed_data';

import 'package:bot_toast/bot_toast.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ez_learn_dashboard/app/subject_detail/presentation/ui/screen/subject_detail_screen.dart';
import 'package:ez_learn_dashboard/app/subjects/presentation/ui/widget/subject_item.dart';
import 'package:ez_learn_dashboard/common/component/failed_widget.dart';
import 'package:ez_learn_dashboard/common/component/loading_widget.dart';
import 'package:ez_learn_dashboard/common/component/semester_dropdown.dart';
import 'package:ez_learn_dashboard/common/component/year_dropdown.dart';
import 'package:ez_learn_dashboard/common/result_builder/result_builder.dart';
import 'package:ez_learn_dashboard/common/widget/custom_reactive_field.dart';
import 'package:ez_learn_dashboard/common/widget/input_title.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../common/component/page_bar.dart';
import '../../../../../common/imports/imports.dart';
import '../../../../../common/injection/injection.dart';
import '../../../../../common/widget/custom_popup.dart';
import '../../state/bloc/subject_bloc.dart';

class SubjectsScreen extends StatelessWidget {
  final BeamerDelegate router;

  const SubjectsScreen({Key? key, required this.router}) : super(key: key);

  static const String pagePath = 'subjects';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SubjectBloc>()..add(GetAllSubject()),
      child: Builder(builder: (context) {
        return PageBar(
          title: 'المواد',
          buttonText: 'مادة جديدة',
          child: BlocBuilder<SubjectBloc, SubjectState>(
            builder: (context, state) {
              return ResultBuilder(
                result: state.result,
                init: () => const SizedBox(),
                loading: () => const Expanded(child:  LoadingWidget()),
                error: (error) => FailedWidget(error: error, onPressed: () {}),
                success: (data) => Expanded(
                  child: GridView.builder(
                    itemCount: data.length,
                    padding: REdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 5 / 7.2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, i) {
                      final item = data[i];
                      return SubjectItem(
                        subjectName: item.name,
                        subjectImage: Assets.imagesDefault,
                        pracNumber: item.practicalLectureCount,
                        prevExamNumber: item.previousExamCount,
                        semester: item.semester,
                        theoNumber: item.theoreticalLectureCount,
                        vidNumber: item.videoCount,
                        year: item.year,
                        onTap: () {
                          router.beamToNamed(item.id/*SubjectDetailScreen.pagePath*/);
                        },
                      );
                    },
                  ),
                ),
              );
            },
          ),
          onButtonPressed: () {
            final bloc = context.read<SubjectBloc>();
            showCustomPopup(
              context: context,
              onConfirm: () {
                bloc.add(AddSubject());
              },
              title: 'مادة جديدة',
              child: BlocConsumer<SubjectBloc, SubjectState>(
                bloc: bloc,
                listener: (context, state) {
                  if (state.status.isSuccess()) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return ReactiveForm(
                    formGroup: SubjectBloc.form,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: context.screenWidth * 0.3,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const InputTitle(text: 'اسم المادة', child: CustomReactiveField(controlName: 'name')),
                              const Row(
                                children: [
                                  Flexible(
                                    child: YearDropdown(controlName: 'year'),
                                  ),
                                  Flexible(
                                    child: SemesterDropdown(controlName: 'semester'),
                                  )
                                ],
                              ),
                              const InputTitle(
                                text: 'وصف المادة',
                                child: CustomReactiveField(
                                  controlName: 'description',
                                  keyboardType: TextInputType.multiline,
                                  minLines: 1,
                                  maxLines: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    const Text('اختيارية'),
                                    ReactiveCheckbox(
                                      formControlName: 'isOptional',
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        ReactiveFormConsumer(
                          builder: (context, form, _) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () async {
                                final ImagePicker picker = ImagePicker();
                                final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                                form.control('image').value = await image?.readAsBytes();
                              },
                              child: SizedBox(
                                width: context.screenWidth * 0.17,
                                height: context.screenWidth * 0.15,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(12),
                                    dashPattern: const [6, 2.5],
                                    child: Center(
                                      child: form.control('image').value != null
                                          ? Image.memory(form.control('image').value)
                                          : const Icon(Icons.image_sharp, size: 120),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
