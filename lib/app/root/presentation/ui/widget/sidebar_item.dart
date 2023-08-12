import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../common/imports/imports.dart';

class SidebarItem extends StatefulWidget {
  final BuildContext context;
  final IconData icon;
  final String text;
  final String pathPattern;
  final GlobalKey<BeamerState> beamerKey;
  final VoidCallback onTap;
  final bool isLogout;

  const SidebarItem({
    Key? key,
    required this.context,
    required this.icon,
    required this.text,
    required this.pathPattern,
    required this.beamerKey,
    required this.onTap,
    this.isLogout = false,
  }) : super(key: key);

  @override
  State<SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem> with SingleTickerProviderStateMixin {
  late final bool isLogout;
  late bool isSelected;

  late final AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    isLogout = widget.isLogout;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isSelected = (widget.beamerKey.currentState?.currentBeamLocation.state.routeInformation.location?.contains(widget.pathPattern)) ?? false;
    return InkWell(
      onTap: widget.onTap,
      onHover: (v) {
        if (v) {
          controller.reset();
          controller.forward();
        }
      },
      child: Animate(
        controller: controller,
        effects: const [ShimmerEffect(duration: Duration(milliseconds: 700))],
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
                widget.icon,
                color: !isLogout
                    ? isSelected
                        ? AppColors.white
                        : null
                    : AppColors.red,
              ),
              const RSizedBox(
                width: 16,
              ),
              AnimatedDefaultTextStyle(
                  style: context.textTheme.titleMedium!.copyWith(
                      color: !isLogout
                          ? isSelected
                              ? AppColors.white
                              : null
                          : AppColors.red),
                  duration: const Duration(milliseconds: 300),
                  child: Text(widget.text)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
