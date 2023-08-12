import 'package:dotted_border/dotted_border.dart';
import 'package:ez_learn_dashboard/app/subject_detail/presentation/ui/screen/subject_detail_screen.dart';
import 'package:ez_learn_dashboard/common/component/semester_dropdown.dart';
import 'package:ez_learn_dashboard/common/component/year_dropdown.dart';
import 'package:ez_learn_dashboard/common/widget/custom_reactive_field.dart';
import 'package:ez_learn_dashboard/common/widget/input_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/component/page_bar.dart';
import '../../../../../common/imports/imports.dart';

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
            childAspectRatio: 4 / 6,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                router.beamToNamed(SubjectDetailScreen.pagePath);
              },
              child: Container(
                decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8), boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(1, 1), // changes position of shadow
                  )
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Image.asset(
                          Assets.imagesDefault,
                          fit: BoxFit.cover,
                        ),
                      ),
                      LayoutBuilder(
                        builder: (context, cons) {
                          return Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runAlignment: WrapAlignment.center,
                            alignment: WrapAlignment.center,
                            runSpacing: 4,
                            children: [
                              _buildContentCount(icon: IconlyBold.work, count: 10),
                              _buildContentCount(icon: IconlyBold.game, count: 7),
                              _buildContentCount(icon: IconlyBold.video, count: 8),
                              _buildContentCount(icon: IconlyBold.paper, count: 3),
                              _buildContentCount(icon: IconlyBold.calendar, count: 1),
                            ],
                          );
                        },
                      ),
                      Padding(
                        padding: REdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'معالجة الإشارة',
                              style: context.textTheme.titleLarge,
                            ),
                            const RSizedBox(
                              height: 6,
                            ),
                            const Text('الفصل الأول - السنة الثالتة'),
                          ],
                        ),
                      ),
                      Container(
                        padding: REdgeInsets.symmetric(vertical: 12),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                        ),
                        alignment: Alignment.center,
                        child: const Text('عرض التفاصيل', style: TextStyle(color: AppColors.white)),
                      ),
                      // Text(i.toString()),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      onButtonPressed: () {
        showCustomPopup(
          context: context,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: context.screenWidth * 0.3,
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const InputTitle(text: 'اسم المادة', child: CustomReactiveField(controlName: 'name')),
                    const Row(
                      children: [YearDropdown(controlName: 'year'), SemesterDropdown(controlName: 'semester')],
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
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: context.screenWidth * 0.17,
                height: context.screenWidth * 0.15,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    dashPattern: const [6, 2.5],
                    child: const Center(
                      child: Icon(Icons.image_sharp, size: 120),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
        // showCupertinoModalPopup(
        //   context: context,
        //   barrierColor: AppColors.textColor.withOpacity(0.4),
        //   builder: (ctx) {
        //     return ReactiveForm(
        //       formGroup: FormGroup({
        //         'name': FormControl(),
        //         'year': FormControl(),
        //         'semester': FormControl(),
        //         'description': FormControl(),
        //       }),
        //       child: Center(
        //         child: Material(
        //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        //           child: SizedBox(
        //             width: context.screenWidth * 0.5,
        //             child: Padding(
        //               padding: const EdgeInsets.all(16),
        //               child: IntrinsicHeight(
        //                 child: Column(
        //                   children: [
        //                     const Row(
        //                       children: [
        //                         const Text(
        //                           'مادة جديدة',
        //                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        //                         ),
        //                       ],
        //                     ),
        //                     const SizedBox(
        //                       height: 8,
        //                     ),
        //                     Row(
        //                       mainAxisSize: MainAxisSize.min,
        //                       crossAxisAlignment: CrossAxisAlignment.end,
        //                       children: [
        //                         SizedBox(
        //                           width: context.screenWidth * 0.3,
        //                           child: const Column(
        //                             mainAxisSize: MainAxisSize.min,
        //                             children: [
        //                               const InputTitle(text: 'اسم المادة', child: CustomReactiveField(controlName: 'name')),
        //                               const Row(
        //                                 children: [YearDropdown(controlName: 'year'), SemesterDropdown(controlName: 'semester')],
        //                               ),
        //                               const InputTitle(
        //                                 text: 'وصف المادة',
        //                                 child: CustomReactiveField(
        //                                   controlName: 'description',
        //                                   keyboardType: TextInputType.multiline,
        //                                   minLines: 1,
        //                                   maxLines: 20,
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                         const Spacer(),
        //                         SizedBox(
        //                           width: context.screenWidth * 0.17,
        //                           height: context.screenWidth * 0.15,
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(8.0),
        //                             child: DottedBorder(
        //                               borderType: BorderType.RRect,
        //                               radius: const Radius.circular(12),
        //                               dashPattern: const [6, 2.5],
        //                               child: const Center(
        //                                 child: Icon(Icons.image_sharp, size: 120),
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                     const SizedBox(
        //                       height: 8,
        //                     ),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.end,
        //                       children: [
        //                         OutlinedButton(
        //                             style: OutlinedButton.styleFrom(
        //                               side: const BorderSide(color: AppColors.red),
        //                               foregroundColor: AppColors.red,
        //                             ),
        //                             onPressed: () {
        //                               Navigator.pop(ctx);
        //                             },
        //                             child: const Padding(
        //                               padding: EdgeInsets.symmetric(horizontal: 8.0),
        //                               child: Text('إلغاء'),
        //                             )),
        //                         const SizedBox(width: 8),
        //                         ElevatedButton(
        //                             onPressed: () {
        //                               Navigator.pop(ctx);
        //                             },
        //                             child: const Padding(
        //                               padding: EdgeInsets.symmetric(horizontal: 8.0),
        //                               child: Text('إضافة'),
        //                             )),
        //                       ],
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // );
      },
    );
  }

  LayoutBuilder _buildContentCount({required IconData icon, required int count}) {
    return LayoutBuilder(builder: (context, cons) {
      return SizedBox(
        width: cons.maxWidth * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(count.toString()),
          ],
        ),
      );
    });
  }
}

showCustomPopup({required BuildContext context, required Widget child, double? width }) {

  return showCupertinoModalPopup(
    context: context,
    barrierColor: AppColors.textColor.withOpacity(0.4),
    builder: (ctx) {
      return ReactiveForm(
        formGroup: FormGroup({
          'name': FormControl(),
          'year': FormControl(),
          'semester': FormControl(),
          'description': FormControl(),
        }),
        child: Center(
          child: Material(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: SizedBox(
              width: width??context.screenWidth * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          const Text(
                            'مادة جديدة',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      child,
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: AppColors.red),
                                foregroundColor: AppColors.red,
                              ),
                              onPressed: () {
                                Navigator.pop(ctx);
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('إلغاء'),
                              )),
                          const SizedBox(width: 8),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(ctx);
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('إضافة'),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
