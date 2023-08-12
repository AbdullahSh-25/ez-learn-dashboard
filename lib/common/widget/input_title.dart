import '../imports/imports.dart';

class InputTitle extends StatelessWidget {
  final String text;
  final Widget child;

  const InputTitle({
    super.key,
    required this.text,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
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
