import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/component/semester_dropdown.dart';
import '../../../../../common/component/year_dropdown.dart';
import '../../../../../common/imports/imports.dart';
import '../../../../../common/widget/custom_reactive_field.dart';
import '../../../../../common/widget/input_title.dart';

class SubjectDetails extends StatelessWidget {
  const SubjectDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool hover = false;
    return Container(
      padding: REdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(-1, 1),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, cons) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'تفاصيل مادة الذكاء الصنعي',
                style: context.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.normal, fontSize: 20.sp),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: cons.maxWidth * 0.66,
                        child: const Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: InputTitle(
                                text: 'اسم المادة',
                                child: CustomReactiveField(controlName: '3'),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(flex: 2, child: YearDropdown(controlName: '1')),
                            Expanded(flex: 2, child: SemesterDropdown(controlName: '1')),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: cons.maxWidth * 0.66,
                        child: const InputTitle(
                          text: 'وصف المادة',
                          child: CustomReactiveField(
                            controlName: '1',
                            maxLines: 4,
                            inputHeight: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SizedBox(
                    width: cons.maxWidth * 0.32,
                    height: 200,
                    child: ReactiveFormConsumer(
                      builder: (context, form, _) => StatefulBuilder(builder: (context, setState) {
                        return InkWell(
                          onHover: (val) {
                            setState(() {
                              hover = val;
                            });
                            printR(val);
                          },
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                            form.control('image').value = await image?.readAsBytes();
                          },
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: form.control('image').value != null
                                      ? Image.memory(
                                          form.control('image').value,
                                          width: cons.maxWidth * 0.32,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          Assets.imagesDefault,
                                          width: cons.maxWidth * 0.32,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                AnimatedOpacity(
                                  opacity: hover ? 1 : 0,
                                  duration: const Duration(milliseconds: 300),
                                  child: Container(
                                    width: cons.maxWidth * 0.32,
                                    height: 200,
                                    color: AppColors.white.withOpacity(0.2),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'تغيير الصورة',
                                      style: TextStyle(color: AppColors.white, fontSize: 22),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}