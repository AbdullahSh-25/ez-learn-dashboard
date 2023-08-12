import 'package:ez_learn_dashboard/app/app_users/presentation/ui/screen/app_users_screen.dart';
import 'package:ez_learn_dashboard/app/dash_users/presentation/ui/screen/dash_users_screen.dart';
import 'package:ez_learn_dashboard/app/notification/presentation/ui/screen/notification_screen.dart';
import 'package:ez_learn_dashboard/app/root/presentation/ui/widget/sidebar_item.dart';
import 'package:ez_learn_dashboard/app/subjects/presentation/ui/screen/subjects_screen.dart';

import '../../../../../common/imports/imports.dart';
import '../../../../marks/presentation/ui/screen/marks_screen.dart';

class Sidebar extends StatefulWidget {
  final GlobalKey<BeamerState> beamerKey;
  final BeamerDelegate router;

  const Sidebar({Key? key, required this.beamerKey, required this.router}) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.router.addListener(() {
        setState(() {});
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.17,
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: REdgeInsets.only(left: 32),
      decoration: BoxDecoration(color: AppColors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 10,
          offset: const Offset(-1, 1), // changes position of shadow
        )
      ]),
      child: Column(
        children: [
          Text(
            'EZ learn',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(
            height: 32,
          ),
          SidebarItem(
              context: context,
              icon: Icons.book,
              text: 'المواد',
              pathPattern: SubjectsScreen.pagePath,
              beamerKey: widget.beamerKey,
              onTap: () {
                widget.beamerKey.currentState!.routerDelegate.beamToNamed('/subjects');
              }),
          SidebarItem(
              context: context,
              icon: Icons.edit_document,
              text: 'العلامات',
              pathPattern: MarksScreen.pagePath,
              beamerKey: widget.beamerKey,
              onTap: () {
                widget.beamerKey.currentState!.routerDelegate.beamToNamed('/marks');
              }),
          SidebarItem(
              context: context,
              icon: Icons.notifications_rounded,
              text: 'الإشعارات',
              pathPattern: NotificationScreen.pagePath,
              beamerKey: widget.beamerKey,
              onTap: () {
                widget.beamerKey.currentState!.routerDelegate.beamToNamed('/notification');
              }),
          SidebarItem(
              context: context,
              icon: Icons.group_rounded,
              text: 'مستخدمو التطبيق',
              pathPattern: AppUsersScreen.pagePath,
              beamerKey: widget.beamerKey,
              onTap: () {
                widget.beamerKey.currentState!.routerDelegate.beamToNamed('/app_users');
              }),
          SidebarItem(
              context: context,
              icon: Icons.group_rounded,
              text: 'مستخدمو اللوحة',
              pathPattern: DashUsersScreen.pagePath,
              beamerKey: widget.beamerKey,
              onTap: () {
                widget.beamerKey.currentState!.routerDelegate.beamToNamed('/dash_users');
              }),
          const Spacer(),
          SidebarItem(
              context: context,
              icon: Icons.logout_rounded,
              text: 'تسجيل الخروج',
              pathPattern: 'second',
              isLogout: true,
              beamerKey: widget.beamerKey,
              onTap: () {}),
        ],
      ),
    );
  }
}

