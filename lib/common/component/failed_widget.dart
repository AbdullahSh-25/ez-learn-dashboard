import '../imports/imports.dart';

class FailedWidget extends StatelessWidget {
  const FailedWidget({
    super.key,
    required this.error,
    this.onPressed,
  });

  final String error;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  width: 250.r,
                  height: 250.r,
                  child: Icon(Icons.warning_rounded,size: 200.r,),
                ),
                Text(
                  error,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50,),
                SizedBox(
                  // width: 118.w,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    child: const Text("إعادة المحاولة"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
