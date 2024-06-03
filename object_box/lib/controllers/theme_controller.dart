import 'package:flutter/material.dart';
import 'package:object_box/abstract_localstorage.dart';
import 'package:object_box/enums/theme.dart';

class ThemeController extends ChangeNotifier {
  ETheme theme = ETheme.light;
  final ILocalStorage _localStorage;

  ThemeController(this._localStorage);

  void setTheme(ETheme newTheme) {
    theme = newTheme;
    _localStorage.setItem("theme", getStringFromTheme(newTheme));
    notifyListeners();
  }

  void getTheme() async {
    var themeFromStorage = await _localStorage.getItem("theme");
    theme = getThemeFromString(themeFromStorage);

    notifyListeners();
  }
}
