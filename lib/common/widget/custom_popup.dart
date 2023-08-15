import 'package:flutter/cupertino.dart';

import '../imports/imports.dart';

showCustomPopup({required BuildContext context, required String title, required Widget child, double? width, VoidCallback? onConfirm}) {
  return showCupertinoModalPopup(
    context: context,
    barrierColor: AppColors.textColor.withOpacity(0.4),
    builder: (ctx) {
      return Center(
        child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: SizedBox(
            width: width ?? context.screenWidth * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    child,
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: AppColors.red),
                              foregroundColor: AppColors.red,
                            ),
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('إلغاء'),
                            )),
                        const SizedBox(width: 8),
                        ElevatedButton(
                            onPressed: onConfirm,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('إضافة'),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
