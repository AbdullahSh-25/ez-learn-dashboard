import 'package:ez_learn_dashboard/app/subject_detail/presentation/ui/screen/subject_detail_screen.dart';

import '../../../../../common/imports/imports.dart';

class SubjectsScreen extends StatelessWidget {
  final BeamerDelegate router;
  const SubjectsScreen({Key? key,required this.router}) : super(key: key);

  static const String pagePath = 'subjects';


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('المواد'),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('مادة جديدة'),
              ),
            ],
          ),
          Expanded(
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
                  onTap: (){
                    router.beamToNamed(SubjectDetailScreen.pagePath);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: const Offset(1, 1), // changes position of shadow
                        )
                      ]
                    ),
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
                                  _buildContentCount(icon: IconlyBold.work,count: 10),
                                  _buildContentCount(icon: IconlyBold.game,count: 7),
                                  _buildContentCount(icon: IconlyBold.video,count: 8),
                                  _buildContentCount(icon: IconlyBold.paper,count: 3),
                                  _buildContentCount(icon: IconlyBold.calendar,count: 1),
                                ],
                              );
                            },
                          ),
                          Padding(
                            padding: REdgeInsets.symmetric(vertical: 8,horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('معالجة الإشارة',style: context.textTheme.titleLarge,),
                                const RSizedBox(height: 6,),
                                Text('الفصل الأول - السنة الثالتة'),
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
          )
        ],
      ),
    );
  }

  LayoutBuilder _buildContentCount({required IconData icon, required int count}) {
    return LayoutBuilder(builder: (context, cons) {
      return SizedBox(
        width: cons.maxWidth * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,size: 16,),
            const SizedBox(width: 4),
            Text(count.toString()),
          ],
        ),
      );
    });
  }
}
