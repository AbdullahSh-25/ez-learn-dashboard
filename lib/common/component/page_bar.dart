import '../imports/imports.dart';

class PageBar extends StatelessWidget {
  const PageBar({
    Key? key,
    required this.title,
    required this.buttonText,
    this.onButtonPressed,
    required this.child,
  }) : super(key: key);

  final String title;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.textTheme.headlineSmall,
              ),
              onButtonPressed != null
                  ? ElevatedButton.icon(
                      onPressed: onButtonPressed,
                      icon: const Icon(Icons.add),
                      label: Text(buttonText),
                    )
                  : const SizedBox(),
            ],
          ),
          child,
        ],
      ),
    );
  }
}
