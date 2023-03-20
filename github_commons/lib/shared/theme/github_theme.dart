import 'package:flutter/material.dart';

class GithubTheme {
  GithubTheme._();

  static const String themeName = 'github_commons';
  static const String fontFamilyName = 'Product Sans';
  static const Color white = Color(0xFFFFFFFF);
  static const Color primaryColor = Color(0xFF323232);
  static const Color secondColor = Color(0xFFF6F6F6);

  static ThemeData theme = ThemeData(
    fontFamily: fontFamilyName,
    brightness: Brightness.light,
    scaffoldBackgroundColor: secondColor,
    primaryIconTheme: const IconThemeData(color: secondColor),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: createMaterialColor(secondColor),
    ).copyWith(background: primaryColor),
  );

  static MaterialColor createMaterialColor(Color color) {
    final HSLColor hslColor = HSLColor.fromColor(color);
    final double lightness = hslColor.lightness;
    const int lowDivisor = 6;
    const int highDivisor = 5;
    final double lowStep = (1.0 - lightness) / lowDivisor;
    final double highStep = lightness / highDivisor;

    return MaterialColor(color.value, {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    });
  }

  static const TextStyle simpleStyleText = TextStyle(
    fontFamily: GithubTheme.fontFamilyName,
    package: GithubTheme.themeName,
    color: GithubTheme.secondColor,
  );
}
