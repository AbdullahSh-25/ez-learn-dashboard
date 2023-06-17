import '../../../../../common/imports/imports.dart';

class Sidebar extends StatelessWidget {
  final beamerKey;
  
  const Sidebar({Key? key,required this.beamerKey}) : super(key: key);

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
          _buildSidebarItem(
              context: context,
              icon: Icons.home_rounded,
              text: 'الرئيسية',
              pathPattern: 'first',
              isSelected: true,
              beamerKey: beamerKey,
              onTap: () {}),
          _buildSidebarItem(
              context: context,
              icon: Icons.book,
              text: 'المواد',
              pathPattern: 'second',
              isSelected: false,
              beamerKey: beamerKey,
              onTap: () {}),
          _buildSidebarItem(
              context: context,
              icon: Icons.edit_document,
              text: 'العلامات',
              pathPattern: 'second',
              isSelected: false,
              beamerKey: beamerKey,
              onTap: () {}),
          _buildSidebarItem(
              context: context,
              icon: Icons.notifications_rounded,
              text: 'الإشعارات',
              pathPattern: 'second',
              isSelected: false,
              beamerKey: beamerKey,
              onTap: () {}),
          _buildSidebarItem(
              context: context,
              icon: Icons.group_rounded,
              text: 'مستخدمو التطبيق',
              pathPattern: 'second',
              isSelected: false,
              beamerKey: beamerKey,
              onTap: () {}),
          _buildSidebarItem(
              context: context,
              icon: Icons.settings_rounded,
              text: 'الإعدادات',
              pathPattern: 'second',
              isSelected: false,
              beamerKey: beamerKey,
              onTap: () {}),
          const Spacer(),
          _buildSidebarItem(
              context: context,
              icon: Icons.logout_rounded,
              text: 'تسجيل الخروج',
              pathPattern: 'second',
              isSelected: false,
              isLogout: true,
              beamerKey: beamerKey,
              onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildSidebarItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    required String pathPattern,
    required GlobalKey<BeamerState> beamerKey,
    required bool isSelected,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    // final isSelected = (beamerKey.currentState?.currentBeamLocation.state.routeInformation.location?.contains(pathPattern))??false;
    // printK(isSelected);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: REdgeInsets.symmetric(vertical: 4),
        padding: REdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
            colors: [AppColors.primary, AppColors.primary.withOpacity(0.6)],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          )
              : null,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: !isLogout?isSelected ? AppColors.white : null:AppColors.red,
            ),
            const RSizedBox(
              width: 16,
            ),
            AnimatedDefaultTextStyle(
                style: context.textTheme.titleMedium!.copyWith(color: !isLogout?isSelected?AppColors.white:null:AppColors.red),
                duration: const Duration(milliseconds: 300),
                child:  Text(
                    text
                )),
          ],
        ),
      ),
    );
  }
  
  
}
