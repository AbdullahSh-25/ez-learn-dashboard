import 'package:flutter/material.dart';

extension SizeEx on BuildContext {
  Size _getSize() {
    return MediaQuery.of(this).size;
  }

  double get screenWidth => _getSize().width;

  double get screenHeight => _getSize().height;
}

extension ThemeEx on BuildContext {
  ThemeData _getTheme() {
    return Theme.of(this);
  }

  TextTheme get textTheme => _getTheme().textTheme;

  ThemeData get theme => _getTheme();
}
