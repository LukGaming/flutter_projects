enum ETheme { light, dark }

String getStringFromTheme(ETheme theme) {
  switch (theme) {
    case ETheme.light:
      return "light";
    default:
      return "dark";
  }
}

ETheme getThemeFromString(String theme) {
  switch (theme) {
    case "light":
      return ETheme.light;
    default:
      return ETheme.dark;
  }
}
