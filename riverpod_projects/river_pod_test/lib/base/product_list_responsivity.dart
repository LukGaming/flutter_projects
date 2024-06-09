enum ScreenSize { sm, md, lg, xl }

ScreenSize getScreenSize(double size) {
  if (size <= 500) {
    return ScreenSize.sm;
  } else if (size <= 800) {
    return ScreenSize.md;
  } else if (size < 1280) {
    return ScreenSize.lg;
  } else {
    return ScreenSize.xl;
  }
}

int getSliverDelegatesCrossQuantityFromScreenSize(ScreenSize size) {
  switch (size) {
    case ScreenSize.sm:
      return 2;
    case ScreenSize.md:
      return 3;
    case ScreenSize.lg:
      return 4;
    case ScreenSize.xl:
      return 5;
    default:
      return 2;
  }
}
