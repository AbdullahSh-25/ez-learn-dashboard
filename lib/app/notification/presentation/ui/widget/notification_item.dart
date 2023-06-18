import 'package:iconly/iconly.dart';

import '../../../../../common/imports/imports.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(vertical: 16),
      padding: REdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
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
          Row(
            children: [
              const Text('عنوان الإشعار'),
              const Spacer(),
              const Text('2024/6/13 01:53'),
              const SizedBox(width: 8),
              Icon(IconlyLight.calendar, size: 20.r),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،'
                ' لقد تم توليد هذا النص من مولد النص العربى،'
                ' حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى'
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،'
                ' لقد تم توليد هذا النص من مولد النص العربى،'
                ' حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
            // textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
