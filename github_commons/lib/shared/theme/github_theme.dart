import 'package:flutter/material.dart';

class GithubTheme {
  GithubTheme._();

  static const String themeName = 'github_commons';
  static const String fontFamilyName = 'Product Sans';
  static const Color primaryColor = Color(0xff323232);
  static const Color secondColor = Color(0xfff6f6f6);

  static ThemeData theme = ThemeData(
    fontFamily: 'Product Sans',
    brightness: Brightness.light,
    primarySwatch: createMaterialColor(secondColor),
    backgroundColor: primaryColor,
    scaffoldBackgroundColor: secondColor,
    primaryIconTheme: const IconThemeData(color: secondColor),
  );

  static MaterialColor createMaterialColor(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = hslColor.lightness;
    const lowDivisor = 6;
    const highDivisor = 5;
    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;
    var swatch = {
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
    };

    return MaterialColor(color.value, swatch);
  }

  static const TextStyle simpleStyleText = TextStyle(
    fontFamily: GithubTheme.fontFamilyName,
    package: GithubTheme.themeName,
    color: GithubTheme.secondColor,
  );
}
