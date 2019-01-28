import 'package:flutter/material.dart';

class ArchSampleTheme {
  static get theme {
    const Color primaryColor = Color(0xFF0175c2);
    const Color secondaryColor = Color(0xFF13B9FD);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );

    final originalTextTheme = ThemeData.light().textTheme;
    final originalBody1 = originalTextTheme.body1;

    return ThemeData.light().copyWith(
        colorScheme: colorScheme,
        primaryColor: primaryColor,
        accentColor: secondaryColor,
        buttonColor: primaryColor,
        backgroundColor: Colors.white,
        textTheme: originalTextTheme.copyWith(
            body1:
                originalBody1.copyWith(decorationColor: Colors.transparent)));
  }
}
