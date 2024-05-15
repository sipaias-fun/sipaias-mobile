import 'package:flutter/material.dart';
import 'package:sipaias_fun_mobile/cores/constant/i_constant.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_text_theme.dart';

extension ISizeExtensions on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get disableColor => Theme.of(this).disabledColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  double get padding0 => IConstant.padding / 2;

  double get padding1 => IConstant.padding * 1;

  double get padding2 => IConstant.padding * 2;

  double get padding3 => IConstant.padding * 3;

  double get padding4 => IConstant.padding * 4;

  double get padding5 => IConstant.padding * 5;

  double get padding6 => IConstant.padding * 6;

  double get padding7 => IConstant.padding * 7;

  double get padding8 => IConstant.padding * 8;

  double get padding9 => IConstant.padding * 9;

  double get padding10 => IConstant.padding * 10;

  TextStyle? get displayLarge => ITextTheme.text.displayLarge;
  TextStyle? get displayMedium => ITextTheme.text.displayMedium;
  TextStyle? get displaySmall => ITextTheme.text.displaySmall;
  TextStyle? get headlineLarge => ITextTheme.text.headlineLarge;
  TextStyle? get headlineMedium => ITextTheme.text.headlineMedium;
  TextStyle? get headlineSmall => ITextTheme.text.headlineSmall;
  TextStyle? get titleLarge => ITextTheme.text.titleLarge;
  TextStyle? get titleMedium => ITextTheme.text.titleMedium;
  TextStyle? get titleSmall => ITextTheme.text.titleSmall;
  TextStyle? get bodyLarge => ITextTheme.text.bodyLarge;
  TextStyle? get bodyMedium => ITextTheme.text.bodyMedium;
  TextStyle? get bodySmall => ITextTheme.text.bodySmall;
  TextStyle? get labelLarge => ITextTheme.text.labelLarge;
  TextStyle? get labelMedium => ITextTheme.text.labelMedium;
  TextStyle? get labelSmall => ITextTheme.text.labelSmall;

  Widget sbHeight({double? size}) {
    return SizedBox(height: size ?? padding2);
  }

  Widget sbWidth({double? size}) {
    return SizedBox(width: size ?? padding2);
  }
}
