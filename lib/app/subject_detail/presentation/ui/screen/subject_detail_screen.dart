import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:ez_learn_dashboard/app/subject_detail/presentation/ui/widget/prev_exam_section.dart';
import 'package:ez_learn_dashboard/app/subject_detail/presentation/ui/widget/quiz_section.dart';
import 'package:ez_learn_dashboard/app/subject_detail/presentation/ui/widget/video_section.dart';
import 'package:ez_learn_dashboard/common/widget/custom_reactive_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/component/semester_dropdown.dart';
import '../../../../../common/component/year_dropdown.dart';
import '../../../../../common/imports/imports.dart';
import '../../../../../common/widget/custom_popup.dart';
import '../../../../../common/widget/input_title.dart';
import 'dart:html' as html;

import '../widget/prac_lecture_section.dart';
import '../widget/subject_details_card.dart';
import '../widget/theo_lecture_section.dart';

class SubjectDetailScreen extends StatelessWidget {
  final BeamerDelegate router;

  const SubjectDetailScreen({Key? key, required this.router}) : super(key: key);

  static const String pagePath = 'subject_detail';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: ReactiveForm(
        formGroup: FormGroup({
          '1': FormControl<int>(),
          '2': FormControl<int>(),
          '3': FormControl<String>(),
          'image': FormControl<Uint8List>(),
        }),
        child: ListView(
          padding: REdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          primary: true,
          children: [
            Row(
              children: [
                Text(
                  'المواد',
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
            const SubjectDetails(),
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
                  const TabBar(
                    tabs: [
                      Tab(child: Text('النظري (5)')),
                      Tab(child: Text('العملي (7)')),
                      Tab(child: Text('الفيديوهات (9)')),
                      Tab(child: Text('الاختبارات (11)')),
                      Tab(child: Text('أسئلة الدورات (23)')),
                    ],
                  ),
                  const SizedBox(
                    height: 500,
                    child: TabBarView(
                      children: [
                        TheoLectureSection(),
                        PracLectureSection(),
                         VideosSection(),
                         QuizSection(),
                         PrevExamSection(),
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
      ),
    );
  }
}

