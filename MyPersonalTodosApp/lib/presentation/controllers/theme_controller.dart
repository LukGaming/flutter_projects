import 'package:flutter/material.dart';

import 'package:object_box/enums/theme.dart';
import 'package:object_box/infrastructure/repositories/ilocal_storage.dart';

class ThemeController extends ChangeNotifier {
  ETheme theme = ETheme.light;

  final ILocalStorage localStorage;

  ThemeController(this.localStorage);

  void setTheme(ETheme newTheme) async {
    theme = newTheme;
    await localStorage.setItem("theme", getStringFromTheme(newTheme));
    notifyListeners();
  }

  void getTheme() async {
    var themeFromStorage = await localStorage.getItem("theme");
    theme = getThemeFromString(themeFromStorage);
    notifyListeners();
  }
}
