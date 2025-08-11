import 'package:flutter/material.dart';
import 'package:demandium_serviceman/utils/core_export.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    fontFamily: getFontFamily(),
    primaryColor: const Color(0xFF265D4C),
    primaryColorLight: const Color(0xFFF0F4F8),
    primaryColorDark: const Color(0xFF265D4C),
    secondaryHeaderColor: const Color(0xFF8797AB),
    cardColor: const Color(0xFF265D4C),

    disabledColor: const Color(0xFF484848),
    scaffoldBackgroundColor: const Color(0xFF010d15),
    brightness: Brightness.dark,
    hintColor: const Color(0xFFFFFFFF),
    focusColor: const Color(0xFF484848),
    hoverColor: const Color(0xFFABA9A7),
    shadowColor: const Color(0xFF4a5361), colorScheme: const ColorScheme.dark(
      primary: Color(0xFF265D4C),
      secondary: Color(0xFFf57d00),
      tertiary: Color(0xFFFF6767),
      onTertiary: Color(0xff7c6516),
      surfaceTint: Color(0xff158a52)
  ).copyWith(surface: const Color(0xFF010d15)).copyWith(error: const Color(0xFFdd3135)),

  );
}

// Keep the old variable for backward compatibility
ThemeData get dark => getDarkTheme();
