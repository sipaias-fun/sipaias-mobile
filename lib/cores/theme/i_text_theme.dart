import 'package:flutter/material.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_colors.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_sizes.dart';

class ITextTheme {
  static TextTheme get text {
    return const TextTheme(
      displayLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: Sizes.xl6,
        color: Palette.black,
      ),
      displayMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: Sizes.xl5,
        color: Palette.black,
      ),
      displaySmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: Sizes.xl4,
        color: Palette.black,
      ),
      headlineLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: Sizes.xl4,
        color: Palette.black,
      ),
      headlineMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: Sizes.xl3,
        color: Palette.black,
      ),
      headlineSmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: Sizes.xl2,
        color: Palette.black,
      ),
      titleMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: Sizes.xl,
        color: Palette.black,
      ),
      titleSmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: Sizes.lg,
        color: Palette.black,
      ),
      bodyLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: Sizes.lg,
        color: Palette.black,
      ),
      bodyMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: Sizes.base,
        color: Palette.black,
      ),
      bodySmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: Sizes.sm,
        color: Palette.black,
      ),
      labelLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: Sizes.base,
        color: Palette.black,
      ),
      labelMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: Sizes.sm,
        color: Palette.black,
      ),
      labelSmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: Sizes.xs,
        color: Palette.black,
      ),
    );
  }
}
