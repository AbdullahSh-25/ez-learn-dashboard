import '../../../../../common/imports/imports.dart';

class SubjectItem extends StatelessWidget {
  final VoidCallback onTap;
  final String subjectName;
  final String subjectImage;
  final int theoNumber;
  final int pracNumber;
  final int vidNumber;
  final int prevExamNumber;
  final int semester;
  final int year;

  const SubjectItem({
    Key? key,
    required this.onTap,
    required this.subjectName,
    required this.subjectImage,
    required this.theoNumber,
    required this.pracNumber,
    required this.vidNumber,
    required this.prevExamNumber,
    required this.semester,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(1, 1),
            )
          ],
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
                  subjectImage,
                  fit: BoxFit.cover,
                ),
              ),
              LayoutBuilder(
                builder: (context, cons) {
                  return SizedBox(
                    width: cons.maxWidth,
                    child: Padding(
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: cons.maxWidth * 0.45,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _buildContentCount(content: 'النظري', count: theoNumber),
                                  _buildContentCount(content: 'الفيديوهات', count: vidNumber),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: cons.maxWidth * 0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _buildContentCount(content: 'العملي', count: pracNumber),
                                _buildContentCount(content: 'الدورات', count: prevExamNumber),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subjectName,
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
  }

  Widget _buildContentCount({required String content, required int count}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(content),
        const SizedBox(width: 4),
        Text(count.toString()),
      ],
    );
  }
}
