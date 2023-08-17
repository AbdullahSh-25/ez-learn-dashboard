import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:ez_learn_dashboard/app/subject_detail/presentation/ui/widget/prev_exam_section.dart';
import 'package:ez_learn_dashboard/app/subject_detail/presentation/ui/widget/quiz_section.dart';
import 'package:ez_learn_dashboard/app/subject_detail/presentation/ui/widget/video_section.dart';
import 'package:ez_learn_dashboard/common/component/failed_widget.dart';
import 'package:ez_learn_dashboard/common/component/loading_widget.dart';
import 'package:ez_learn_dashboard/common/result_builder/result_builder.dart';
import 'package:ez_learn_dashboard/common/widget/custom_reactive_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/component/semester_dropdown.dart';
import '../../../../../common/component/year_dropdown.dart';
import '../../../../../common/imports/imports.dart';
import '../../../../../common/injection/injection.dart';
import '../../../../../common/widget/custom_popup.dart';
import '../../../../../common/widget/input_title.dart';
import 'dart:html' as html;

import '../../state/bloc/subject_detail_bloc.dart';
import '../widget/prac_lecture_section.dart';
import '../widget/subject_details_card.dart';
import '../widget/theo_lecture_section.dart';

class SubjectDetailScreen extends StatelessWidget {
  final BeamerDelegate router;
  final String subjectId;

  const SubjectDetailScreen({
    Key? key,
    required this.router,
    required this.subjectId,
  }) : super(key: key);

  static const String pagePath = 'subject_detail';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SubjectDetailBloc>()..add(GetSubjectById(subjectId)),
      child: DefaultTabController(
        length: 5,
        child: ReactiveForm(
          formGroup: SubjectDetailBloc.form,
          child: ListView(
            padding: REdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            primary: true,
            children: [
              Row(
                children: [
                  Text(
                    'تفاصيل مادة',
                    style: context.textTheme.headlineSmall,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: REdgeInsets.symmetric(horizontal: 8),
                      side: const BorderSide(color: AppColors.primary),
                    ),
                    child: const Text('حفظ'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      router.beamBack();
                    },
                    child: const Text('تراجع'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.red,
                      side: const BorderSide(color: AppColors.red),
                    ),
                    child: const Text('حذف'),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<SubjectDetailBloc, SubjectDetailState>(
                builder: (context, state) {
                  return ResultBuilder(
                    result: state.result,
                    init: () => const SizedBox(),
                    loading: () => const LoadingWidget(),
                    error: (error) => FailedWidget(
                      error: error,
                      onPressed: () {},
                    ),
                    success: (data) => Column(
                      children: [
                        SubjectDetails(
                          id: data.id,
                          subjectName: data.subjectName,
                          year: data.year,
                          semester: data.semester,
                          description: data.description,
                          imageUrl: data.imageUrl,
                          isOptional: data.isOptional,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Container(
                          padding: REdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: const Offset(-1, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'محتويات المادة',
                                style: context.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.normal, fontSize: 20.sp),
                              ),
                              TabBar(
                                tabs: [
                                  Tab(child: Text('النظري (${data.theoreticalLecture.length})')),
                                  Tab(child: Text('العملي (${data.practicalLecture.length})')),
                                  Tab(child: Text('الفيديوهات (${data.videos.length})')),
                                  Tab(child: Text('الاختبارات (${data.questions.length})')),
                                  Tab(child: Text('أسئلة الدورات (${data.previousExam.length})')),
                                ],
                              ),
                              SizedBox(
                                height: 500,
                                child: TabBarView(
                                  children: [
                                    TheoLectureSection(subjectId: data.id, lectures: data.theoreticalLecture),
                                    PracLectureSection(subjectId: data.id, lectures: data.practicalLecture),
                                    VideosSection(videos: data.videos),
                                    QuizSection(questions: data.questions),
                                    PrevExamSection(prevExams: data.previousExam),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
