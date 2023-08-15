import 'package:dotted_border/dotted_border.dart';
import 'package:ez_learn_dashboard/common/widget/custom_reactive_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/component/semester_dropdown.dart';
import '../../../../../common/component/year_dropdown.dart';
import '../../../../../common/imports/imports.dart';
import '../../../../../common/widget/custom_popup.dart';
import '../../../../../common/widget/input_title.dart';
import 'dart:html' as html;


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
        }),
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Column(
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
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: _buildInputTitle(
                                            text: 'اسم المادة',
                                            child: const CustomReactiveField(controlName: '3'),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Expanded(flex: 2, child: YearDropdown(controlName: '1')),
                                        const Expanded(flex: 2, child: SemesterDropdown(controlName: '1')),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: cons.maxWidth * 0.66,
                                    child: _buildInputTitle(
                                      text: 'وصف المادة',
                                      child: const CustomReactiveField(
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
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    Assets.imagesDefault,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
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
                      const TabBar(
                        tabs: [
                          Tab(child: Text('النظري (5)')),
                          Tab(child: Text('العملي (7)')),
                          Tab(child: Text('الفيديوهات (9)')),
                          Tab(child: Text('الاختبارات (11)')),
                          Tab(child: Text('أسئلة الدورات (23)')),
                        ],
                      ),
                      SizedBox(
                        height: 600,
                        child: TabBarView(
                          children: [
                            LayoutBuilder(
                              builder: (context, cons) {
                                return Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'محاضرات النظري',
                                            style: context.textTheme.headlineSmall,
                                          ),
                                          ReactiveFormConsumer(
                                            builder: (BuildContext context, FormGroup formGroup, Widget? child) {
                                              return ElevatedButton(
                                                onPressed: () {
                                                  showCustomPopup(
                                                    context: context,
                                                    title: 'محضارة نظري جديدة',
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: [
                                                        SizedBox(
                                                          width: context.screenWidth * 0.3,
                                                          child: const Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: [
                                                              InputTitle(text: 'اسم الملف', child: CustomReactiveField(controlName: 'name')),
                                                              InputTitle(
                                                                text: 'مدة الدراسة المتوقعة',
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
                                                        SizedBox(
                                                          width: context.screenWidth * 0.17,
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: DottedBorder(
                                                              borderType: BorderType.RRect,
                                                              radius: const Radius.circular(12),
                                                              dashPattern: const [6, 2.5],
                                                              child: const Center(
                                                                child: Icon(Icons.add_circle_outline_rounded, size: 120),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                child: const Text('إضافة محاضرة'),
                                              );
                                            },
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
                                                )),
                                                Expanded(
                                                    child: Text(
                                                  'مدة الدراسة المتوقعة',
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
                                                        'المحاضرة الأولى',
                                                        style: context.textTheme.titleMedium,
                                                      ),
                                                    ),),
                                                    Expanded(
                                                        child: Padding(
                                                      padding: const EdgeInsets.only(right: 4),
                                                      child: Text(
                                                        '1 ساعة و20 دقيقة تقريبا',
                                                        style: context.textTheme.titleMedium,
                                                      ),
                                                    ),),
                                                    Expanded(
                                                        child: Padding(
                                                      padding: const EdgeInsets.only(right: 4),
                                                      child: Text(
                                                        '2077-8-30',
                                                        style: context.textTheme.titleMedium,
                                                      ),
                                                    ),),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(right: 4),
                                                        child: Row(
                                                          children: [
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                html.window.open('https://www2.seas.gwu.edu/~dorpjr/EMSE269/Extra%20Problems/Extra%20Problem%206%20-%20Solving%20Decision%20Trees%20-%20Solution%20Key.pdf', 'New Tab');
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
                                                                router.beamBack();
                                                              },
                                                              child: const Text('تعديل'),
                                                            ),
                                                            const Spacer(),
                                                            OutlinedButton(
                                                              onPressed: () {

                                                                // https://www2.seas.gwu.edu/~dorpjr/EMSE269/Extra%20Problems/Extra%20Problem%206%20-%20Solving%20Decision%20Trees%20-%20Solution%20Key.pdf
                                                              },
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
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            LayoutBuilder(builder: (context, cons) {
                              return Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'محاضرات العملي',
                                          style: context.textTheme.headlineSmall,
                                        ),
                                        ReactiveFormConsumer(
                                          builder: (BuildContext context, FormGroup formGroup, Widget? child) {
                                            return ElevatedButton(
                                              onPressed: () {
                                                showCustomPopup(
                                                  context: context,
                                                  title: 'محضارة عملي جديدة',
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      SizedBox(
                                                        width: context.screenWidth * 0.3,
                                                        child: const Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            InputTitle(text: 'اسم الملف', child: CustomReactiveField(controlName: 'name')),
                                                            InputTitle(
                                                              text: 'مدة الدراسة المتوقعة',
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
                                                      SizedBox(
                                                        width: context.screenWidth * 0.17,
                                                        // height: context.screenWidth * 0.15,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: DottedBorder(
                                                            borderType: BorderType.RRect,
                                                            radius: const Radius.circular(12),
                                                            dashPattern: const [6, 2.5],
                                                            child: const Center(
                                                              child: Icon(Icons.add_circle_outline_rounded, size: 120),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                                // showDialog(
                                                //     context: context,
                                                //     builder: (_) {
                                                //       return Dialog(
                                                //         child: ReactiveForm(
                                                //           formGroup: formGroup,
                                                //           child: SizedBox(
                                                //               width: cons.maxWidth * 0.25 - 12,
                                                //               child: Column(
                                                //                 children: [
                                                //                   _buildInputTitle(
                                                //                       text: 'اسم المادة', child: const CustomReactiveField(controlName: '1')),
                                                //                   _buildInputTitle(
                                                //                       text: 'مدة الدراسة المتوقعة',
                                                //                       child: const CustomReactiveField(controlName: '1')),
                                                //                   Padding(
                                                //                     padding: const EdgeInsets.all(8.0),
                                                //                     child: Row(
                                                //                       children: const [
                                                //                         Text(
                                                //                           'الملف',
                                                //                           textAlign: TextAlign.start,
                                                //                         ),
                                                //                       ],
                                                //                     ),
                                                //                   ),
                                                //                   Container(
                                                //                     decoration: BoxDecoration(
                                                //                       borderRadius: BorderRadius.circular(12),
                                                //                       border: Border.all(color: AppColors.whiteBlue),
                                                //                     ),
                                                //                     alignment: Alignment.center,
                                                //                     child: const SizedBox(
                                                //                       height: 300,
                                                //                       child: Icon(
                                                //                         Icons.add_circle_outline_rounded,
                                                //                         size: 80,
                                                //                       ),
                                                //                     ),
                                                //                   )
                                                //                 ],
                                                //               )),
                                                //         ),
                                                //       );
                                                //     });
                                              },
                                              child: const Text('إضافة محاضرة'),
                                            );
                                          },
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
                                              )),
                                              Expanded(
                                                  child: Text(
                                                'مدة الدراسة المتوقعة',
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
                                                      'المحاضرة الأولى',
                                                      style: context.textTheme.titleMedium,
                                                    ),
                                                  )),
                                                  Expanded(
                                                      child: Padding(
                                                    padding: const EdgeInsets.only(right: 4),
                                                    child: Text(
                                                      '1 ساعة و20 دقيقة تقريبا',
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
                                                  )),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(right: 4),
                                                      child: Row(
                                                        children: [
                                                          ElevatedButton(
                                                            onPressed: () {},
                                                            style: ElevatedButton.styleFrom(
                                                              padding: REdgeInsets.symmetric(horizontal: 8),
                                                              side: const BorderSide(color: AppColors.primary),
                                                            ),
                                                            child: const Text('معاينة'),
                                                          ),
                                                          const Spacer(),
                                                          OutlinedButton(
                                                            onPressed: () {
                                                              router.beamBack();
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
                              );
                            }),
                            LayoutBuilder(builder: (context, cons) {
                              return Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'الفيديوهات',
                                          style: context.textTheme.headlineSmall,
                                        ),
                                        ReactiveFormConsumer(
                                          builder: (BuildContext context, FormGroup formGroup, Widget? child) {
                                            return ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) {
                                                      return Dialog(
                                                        child: ReactiveForm(
                                                          formGroup: formGroup,
                                                          child: SizedBox(
                                                              width: cons.maxWidth * 0.25 - 12,
                                                              child: Column(
                                                                children: [
                                                                  _buildInputTitle(
                                                                      text: 'اسم الفيديو', child: const CustomReactiveField(controlName: '1')),
                                                                  _buildInputTitle(
                                                                      text: 'مدة الفيديو', child: const CustomReactiveField(controlName: '1')),
                                                                  const Padding(
                                                                    padding: EdgeInsets.all(8.0),
                                                                    child: Row(
                                                                      children: [
                                                                        Text(
                                                                          'الملف',
                                                                          textAlign: TextAlign.start,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(12),
                                                                      border: Border.all(color: AppColors.whiteBlue),
                                                                    ),
                                                                    alignment: Alignment.center,
                                                                    child: const SizedBox(
                                                                      height: 300,
                                                                      child: Icon(
                                                                        Icons.add_circle_outline_rounded,
                                                                        size: 80,
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              )),
                                                        ),
                                                      );
                                                    });
                                              },
                                              child: const Text('إضافة محاضرة'),
                                            );
                                          },
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
                                                'اسم الفيديو',
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
                                                  )),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(right: 4),
                                                      child: Row(
                                                        children: [
                                                          ElevatedButton(
                                                            onPressed: () {},
                                                            style: ElevatedButton.styleFrom(
                                                              padding: REdgeInsets.symmetric(horizontal: 8),
                                                              side: const BorderSide(color: AppColors.primary),
                                                            ),
                                                            child: const Text('معاينة'),
                                                          ),
                                                          const Spacer(),
                                                          OutlinedButton(
                                                            onPressed: () {
                                                              router.beamBack();
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
                              );
                            }),
                            LayoutBuilder(builder: (context, cons) {
                              return Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'الاختبارات',
                                          style: context.textTheme.headlineSmall,
                                        ),
                                        ReactiveFormConsumer(
                                          builder: (BuildContext context, FormGroup formGroup, Widget? child) {
                                            return ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) {
                                                      return Dialog(
                                                        child: ReactiveForm(
                                                          formGroup: formGroup,
                                                          child: SizedBox(
                                                              width: cons.maxWidth * 0.25 - 12,
                                                              child: Column(
                                                                children: [
                                                                  _buildInputTitle(
                                                                      text: 'اسم المادة', child: const CustomReactiveField(controlName: '1')),
                                                                  _buildInputTitle(
                                                                      text: 'مدة الدراسة المتوقعة',
                                                                      child: const CustomReactiveField(controlName: '1')),
                                                                  const Padding(
                                                                    padding: EdgeInsets.all(8.0),
                                                                    child: Row(
                                                                      children: [
                                                                        Text(
                                                                          'الملف',
                                                                          textAlign: TextAlign.start,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(12),
                                                                      border: Border.all(color: AppColors.whiteBlue),
                                                                    ),
                                                                    alignment: Alignment.center,
                                                                    child: const SizedBox(
                                                                      height: 300,
                                                                      child: Icon(
                                                                        Icons.add_circle_outline_rounded,
                                                                        size: 80,
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              )),
                                                        ),
                                                      );
                                                    });
                                              },
                                              child: const Text('إضافة محاضرة'),
                                            );
                                          },
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
                                              )),
                                              Expanded(
                                                  child: Text(
                                                'مدة الدراسة المتوقعة',
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
                                                      'المحاضرة الأولى',
                                                      style: context.textTheme.titleMedium,
                                                    ),
                                                  )),
                                                  Expanded(
                                                      child: Padding(
                                                    padding: const EdgeInsets.only(right: 4),
                                                    child: Text(
                                                      '1 ساعة و20 دقيقة تقريبا',
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
                                                  )),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(right: 4),
                                                      child: Row(
                                                        children: [
                                                          ElevatedButton(
                                                            onPressed: () {},
                                                            style: ElevatedButton.styleFrom(
                                                              padding: REdgeInsets.symmetric(horizontal: 8),
                                                              side: const BorderSide(color: AppColors.primary),
                                                            ),
                                                            child: const Text('معاينة'),
                                                          ),
                                                          const Spacer(),
                                                          OutlinedButton(
                                                            onPressed: () {
                                                              router.beamBack();
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
                              );
                            }),
                            LayoutBuilder(builder: (context, cons) {
                              return Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'أسئلة الدورات',
                                          style: context.textTheme.headlineSmall,
                                        ),
                                        ReactiveFormConsumer(
                                          builder: (BuildContext context, FormGroup formGroup, Widget? child) {
                                            return ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) {
                                                      return Dialog(
                                                        child: ReactiveForm(
                                                          formGroup: formGroup,
                                                          child: SizedBox(
                                                              width: cons.maxWidth * 0.25 - 12,
                                                              child: Column(
                                                                children: [
                                                                  _buildInputTitle(
                                                                      text: 'اسم المادة', child: const CustomReactiveField(controlName: '1')),
                                                                  _buildInputTitle(
                                                                      text: 'مدة الدراسة المتوقعة',
                                                                      child: const CustomReactiveField(controlName: '1')),
                                                                  const Padding(
                                                                    padding: EdgeInsets.all(8.0),
                                                                    child: Row(
                                                                      children: [
                                                                        Text(
                                                                          'الملف',
                                                                          textAlign: TextAlign.start,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(12),
                                                                      border: Border.all(color: AppColors.whiteBlue),
                                                                    ),
                                                                    alignment: Alignment.center,
                                                                    child: const SizedBox(
                                                                      height: 300,
                                                                      child: Icon(
                                                                        Icons.add_circle_outline_rounded,
                                                                        size: 80,
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              )),
                                                        ),
                                                      );
                                                    });
                                              },
                                              child: const Text('إضافة محاضرة'),
                                            );
                                          },
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
                                              )),
                                              Expanded(
                                                  child: Text(
                                                'اسم الدكتور',
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
                                                      'دورة 2017 (بدون حل)',
                                                      style: context.textTheme.titleMedium,
                                                    ),
                                                  )),
                                                  Expanded(
                                                      child: Padding(
                                                    padding: const EdgeInsets.only(right: 4),
                                                    child: Text(
                                                      'رياض',
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
                                                            onPressed: () {},
                                                            style: ElevatedButton.styleFrom(
                                                              padding: REdgeInsets.symmetric(horizontal: 8),
                                                              side: const BorderSide(color: AppColors.primary),
                                                            ),
                                                            child: const Text('معاينة'),
                                                          ),
                                                          const Spacer(),
                                                          OutlinedButton(
                                                            onPressed: () {
                                                              router.beamBack();
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
                              );
                            }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
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
        ),
      ),
    );
  }

  Widget _buildInputTitle({required String text, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
