import 'package:ez_learn_dashboard/common/config/theme/style.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: AppStyle.textTheme,
    fontFamily: AppStyle.fontName,
    elevatedButtonTheme: AppStyle.elevatedButtonStyle,
    outlinedButtonTheme: AppStyle.outlinedButtonStyle,
    textButtonTheme: AppStyle.textButtonStyle,
    inputDecorationTheme: AppStyle.inputDecoration,
    iconTheme: AppStyle.iconTheme,
  );
}
