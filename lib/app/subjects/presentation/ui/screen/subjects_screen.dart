import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:ez_learn_dashboard/app/subject_detail/presentation/ui/screen/subject_detail_screen.dart';
import 'package:ez_learn_dashboard/app/subjects/presentation/ui/widget/subject_item.dart';
import 'package:ez_learn_dashboard/common/component/semester_dropdown.dart';
import 'package:ez_learn_dashboard/common/component/year_dropdown.dart';
import 'package:ez_learn_dashboard/common/widget/custom_reactive_field.dart';
import 'package:ez_learn_dashboard/common/widget/input_title.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../common/component/page_bar.dart';
import '../../../../../common/imports/imports.dart';
import '../../../../../common/widget/custom_popup.dart';

class SubjectsScreen extends StatelessWidget {
  final BeamerDelegate router;

  const SubjectsScreen({Key? key, required this.router}) : super(key: key);

  static const String pagePath = 'subjects';

  @override
  Widget build(BuildContext context) {
    return PageBar(
      title: 'المواد',
      buttonText: 'مادة جديدة',
      child: Expanded(
        child: GridView.builder(
          itemCount: 16,
          padding: REdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 5 / 7.2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, i) {
            return SubjectItem(
              subjectName: 'إدارة المشاريع',
              subjectImage: Assets.imagesDefault,
              pracNumber: 5,
              prevExamNumber: 7,
              semester: 1,
              theoNumber: 12,
              vidNumber: 15,
              year: 5,
              onTap: () {
                router.beamToNamed(SubjectDetailScreen.pagePath);
              },
            );
          },
        ),
      ),
      onButtonPressed: () {
        showCustomPopup(
          context: context,
          title: 'مادة جديدة',
          child: ReactiveForm(
            formGroup: FormGroup({
              'name': FormControl(),
              'year': FormControl(),
              'semester': FormControl(),
              'description': FormControl(),
              'image': FormControl<Uint8List>(),
            }),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: context.screenWidth * 0.3,
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InputTitle(text: 'اسم المادة', child: CustomReactiveField(controlName: 'name')),
                      Row(
                        children: [
                          Flexible(
                            child: YearDropdown(controlName: 'year'),
                          ),
                          Flexible(
                            child: SemesterDropdown(controlName: 'semester'),
                          )
                        ],
                      ),
                      InputTitle(
                        text: 'وصف المادة',
                        child: CustomReactiveField(
                          controlName: 'description',
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 20,
                        ),
                      ),
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
          ),
        );
      },
    );
  }
}
