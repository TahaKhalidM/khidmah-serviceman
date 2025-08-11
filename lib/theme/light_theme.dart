import 'package:flutter/material.dart';
import 'package:demandium_serviceman/utils/core_export.dart';

ThemeData getLightTheme() {
  return ThemeData(
    fontFamily: getFontFamily(),
    primaryColor: const Color(0xFF265D4C),
    primaryColorLight: const Color(0xFF265D4C),
    primaryColorDark: const Color(0xFF265D4C),
    secondaryHeaderColor: const Color(0xFF8797AB),
    cardColor: const Color(0xFFFFFFFF),

    disabledColor: const Color(0xFF9E9E9E),
    scaffoldBackgroundColor: const Color(0xFFF7F9FC),
    brightness: Brightness.light,
    hintColor: const Color(0xFF838383),
    focusColor: const Color(0xFFFFFFFF),
    hoverColor: const Color(0xFF265D4C),
    shadowColor: const Color(0xFFD1D5DB), colorScheme: const ColorScheme.light(
      primary: Color(0xFF265D4C),
      secondary: Color(0xFFFF9900),
      tertiary: Color(0xFFFF6767),
      onTertiary: Color(0xFFffda6d),
      surfaceTint: Color(0xff158a52)
  ).copyWith(surface: const Color(0xFFF7F9FC)).copyWith(error: const Color(0xFFFF6767)),
  );
}

// Keep the old variable for backward compatibility
ThemeData get light => getLightTheme();