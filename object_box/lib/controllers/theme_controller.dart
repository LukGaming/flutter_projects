import 'package:flutter/material.dart';
import 'package:object_box/enums/theme.dart';

class ThemeController extends ChangeNotifier {
  ETheme theme = ETheme.light;

  void setTheme(ETheme newTheme) {
    theme = newTheme;
    notifyListeners();
  }
}
