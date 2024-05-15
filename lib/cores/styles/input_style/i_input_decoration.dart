import 'package:flutter/material.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_sizes.dart';

import '../../theme/i_colors.dart';

enum InputDecorationType { outline, underLine }

class IInputDecoration extends InputDecoration {
  IInputDecoration({
    required super.hintText,
    required super.suffixIcon,
    required super.prefixIcon,
    required super.border,
    required super.errorBorder,
    required InputBorder? enableBorder,
    required super.focusedBorder,
    required super.suffixIconConstraints,
    required Color super.fillColor,
    required EdgeInsetsGeometry super.contentPadding,
    required super.errorText,
    super.errorMaxLines,
    double? borderRadius,
    TextStyle? hintStyle,
    super.errorStyle,
  }) : super(
          focusedErrorBorder: border,
          disabledBorder: border,
          enabledBorder: enableBorder,
          counterText: "",
          isDense: true,
          filled: true,
          hintStyle: hintStyle ??
              const TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Palette.gray200,
              ),
          // isCollapsed: true,
        );

  factory IInputDecoration.primary({
    required String? hintText,
    double? borderRadius,
    required String? errorText,
    required Widget? suffixIcon,
    required Widget? prefixIcon,
    BoxConstraints? suffixIconConstraints,
    required Color fillColor,
    Color? borderColor,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    bool isErrorWithoutText = false,
    TextStyle? hintStyle,
    required int errorMaxLines,
  }) {
    InputBorder? border = OutlineInputBorder(
      borderSide: BorderSide(
          color: isErrorWithoutText
              ? Palette.red500
              : errorText == null
                  ? Palette.disable
                  : Palette.secondary,
          width: 1),
      borderRadius: BorderRadius.circular(borderRadius ?? Sizes.xs / 2),
    );
    InputBorder? errorBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Palette.red500, width: 1),
      borderRadius: BorderRadius.circular(borderRadius ?? Sizes.xs / 2),
    );
    InputBorder? focusedBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Palette.green600, width: 1.5),
      borderRadius: BorderRadius.circular(borderRadius ?? Sizes.xs / 2),
    );
    TextStyle? errorStyle = const TextStyle(
      color: Palette.red500,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
    if (inputDecorationType == InputDecorationType.underLine) {
      border = UnderlineInputBorder(
        borderSide: const BorderSide(color: Palette.gray300, width: 1),
        borderRadius: BorderRadius.circular(borderRadius ?? 40.0),
      );
    }
    return IInputDecoration(
      errorStyle: errorStyle,
      hintText: hintText,
      suffixIcon: suffixIcon,
      fillColor: fillColor,
      border: border,
      errorBorder: errorBorder,
      enableBorder: border,
      focusedBorder: focusedBorder,
      contentPadding: const EdgeInsets.symmetric(
          horizontal: Sizes.base, vertical: Sizes.base),
      prefixIcon: prefixIcon,
      suffixIconConstraints: suffixIconConstraints,
      errorText: errorText,
      hintStyle: hintStyle,
      errorMaxLines: errorMaxLines,
    );
  }
}

class IInputDecorationSearch extends InputDecoration {
  const IInputDecorationSearch({
    required super.hintText,
    required super.suffixIcon,
    required super.prefixIcon,
    required super.border,
    required InputBorder? enableBorder,
    required super.focusedBorder,
    required super.suffixIconConstraints,
    required Color super.fillColor,
    required EdgeInsetsGeometry super.contentPadding,
    required super.errorText,
    super.hintStyle,
  }) : super(
          focusedErrorBorder: border,
          disabledBorder: border,
          enabledBorder: enableBorder,
          errorBorder: border,
          counterText: "",
          isDense: true,
          filled: true,
          // isCollapsed: true,
        );

  factory IInputDecorationSearch.search({
    required String? hintText,
    required String? errorText,
    required Widget? suffixIcon,
    required Widget? prefixIcon,
    BoxConstraints? suffixIconConstraints,
    required Color fillColor,
    double borderRadiusSize = 8.0,
    Color? colorBorder,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? hintStyle,
  }) {
    InputBorder? border = OutlineInputBorder(
      borderSide: const BorderSide(color: Palette.disable, width: 1),
      borderRadius: BorderRadius.circular(40.0),
    );
    if (inputDecorationType == InputDecorationType.underLine) {
      border = UnderlineInputBorder(
        borderSide: const BorderSide(color: Palette.disable, width: 1),
        borderRadius: BorderRadius.circular(40.0),
      );
    }
    InputBorder? focusedBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Palette.green600, width: 1.5),
      borderRadius: BorderRadius.circular(40.0),
    );
    return IInputDecorationSearch(
      hintText: hintText,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      fillColor: fillColor,
      border: border,
      enableBorder: border,
      focusedBorder: focusedBorder,
      contentPadding: const EdgeInsets.symmetric(
          horizontal: Sizes.base, vertical: Sizes.base),
      suffixIconConstraints: suffixIconConstraints,
      errorText: errorText,
      hintStyle: hintStyle,
    );
  }
}
