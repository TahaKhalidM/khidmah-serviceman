import 'package:demandium_serviceman/utils/core_export.dart';
import 'package:get/get.dart';

// Helper function to get font family based on current language
String getFontFamily() {
  final localizationController = Get.find<LocalizationController>();
  return localizationController.locale.languageCode == 'ar' 
      ? 'NotoKufiArabic'
      : 'Montserrat';
}

// Helper function to get font family for a specific language code
String getFontFamilyForLanguage(String languageCode) {
  return languageCode == 'ar' ? 'NotoKufiArabic' : 'Montserrat';
}

// Language-aware text styles
TextStyle get robotoLight => TextStyle(
  fontFamily: getFontFamily(),
  fontWeight: FontWeight.w300,
);

TextStyle get robotoRegular => TextStyle(
  fontFamily: getFontFamily(),
  fontWeight: FontWeight.w400,
);

TextStyle robotoRegularLow = TextStyle(
  fontFamily: 'Montserrat', // Keep original for backward compatibility
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeSmall,
);

TextStyle get robotoMedium => TextStyle(
  fontFamily: getFontFamily(),
  fontWeight: FontWeight.w500,
);

TextStyle robotoMediumLow = TextStyle(
  fontFamily: 'Montserrat', // Keep original for backward compatibility
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeSmall,
);

TextStyle robotoMediumHigh = TextStyle(
  fontFamily: 'Montserrat', // Keep original for backward compatibility
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeLarge,
);

TextStyle get robotoBold => TextStyle(
  fontFamily: getFontFamily(),
  fontWeight: FontWeight.w700,
);


List<BoxShadow>? shadow =  [BoxShadow(offset: const Offset(0, 1), blurRadius: 2, color: Colors.black.withValues(alpha:0.15),)];

List<BoxShadow>? lightShadow = [const BoxShadow(offset: Offset(0, 1), blurRadius: 3, spreadRadius: 1, color: Color(0x20D6D8E6),)];
