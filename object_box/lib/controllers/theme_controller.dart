import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:object_box/enums/theme.dart';

class ThemeController extends ChangeNotifier {
  ETheme theme = ETheme.light;

  void setTheme(ETheme newTheme) {
    theme = newTheme;
    localStorage.setItem("theme", getStringFromTheme(newTheme));
    notifyListeners();
  }

  void getTheme() async {
    var themeFromStorage = localStorage.getItem("theme"); // light
    if (themeFromStorage != null) {
      theme = getThemeFromString(themeFromStorage);
    } else {
      theme = ETheme.light;
    }
    notifyListeners();
  }
}
