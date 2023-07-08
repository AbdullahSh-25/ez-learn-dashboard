import 'package:ez_learn_dashboard/common/imports/imports.dart';

import '../widget/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static const String pagePath = 'notification';

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('الإشعارات'),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('إشعار جديد'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                itemCount: 5,
                itemBuilder: (context, i) {
                  return const NotificationItem();
                },
              ),
            )
          ],
        ),
      );
  }
}

