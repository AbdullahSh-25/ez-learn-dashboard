import 'package:ez_learn_dashboard/common/component/page_bar.dart';
import 'package:ez_learn_dashboard/common/component/year_dropdown.dart';
import 'package:ez_learn_dashboard/common/imports/imports.dart';
import 'package:ez_learn_dashboard/common/widget/custom_popup.dart';
import 'package:ez_learn_dashboard/common/widget/custom_reactive_field.dart';
import 'package:ez_learn_dashboard/common/widget/input_title.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../widget/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static const String pagePath = 'notification';

  @override
  Widget build(BuildContext context) {
    return PageBar(
      title: 'الإشعارات',
      buttonText: 'إشعار جديد',
      onButtonPressed: () {
        showCustomPopup(
          context: context,
          title: 'إشعار جديد',
          width: context.screenWidth * 0.35,
          child: ReactiveForm(
            formGroup: FormGroup({
              '1': FormControl(),
              '2': FormControl(),
              '3': FormControl(),
            }),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InputTitle(
                  text: 'عنوان الإشعار',
                  child: CustomReactiveField(
                    controlName: '1',
                  ),
                ),
                InputTitle(
                  text: 'تفاصيل الإشعار',
                  child: CustomReactiveField(
                    controlName: '2',
                    inputHeight: 120,
                    maxLines: 6,
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: YearDropdown(controlName: '3'),
                ),
              ],
            ),
          ),
        );
      },
      child: Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          itemCount: 5,
          itemBuilder: (context, i) {
            return const NotificationItem();
          },
        ),
      ),
    );
  }
}
