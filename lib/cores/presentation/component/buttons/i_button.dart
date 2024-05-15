import 'package:flutter/material.dart';
import 'package:sipaias_fun_mobile/cores/extensions/context_extensions.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_colors.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_sizes.dart';
import 'model/button_models.dart';

class IButton extends StatelessWidget {
  const IButton({
    super.key,
    this.text,
    required this.onPressed,
    this.leftIcon,
    this.rightIcon,
    this.size = ButtonSize.medium,
    this.state = ButtonState.enabled,
    this.type = ButtonType.primary,
    this.background = Palette.emerald600,
    this.foregroundColor = Colors.white,
    this.defaultBorderColor = Colors.black12,
    this.autoResize = true,
    this.borderLineWidth = 1,
    this.removePaddings = false,
    this.horizontalAlignment = MainAxisAlignment.center,
  });

  final String? text;
  final GestureTapCallback onPressed;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final ButtonSize size;
  final ButtonState state;
  final ButtonType type;
  final Color? background;
  final Color foregroundColor;
  final Color defaultBorderColor;
  final bool autoResize;
  final double borderLineWidth;
  final bool removePaddings;
  final MainAxisAlignment horizontalAlignment;

  @override
  Widget build(BuildContext context) {
    // Define a list to store our button's inner elements
    var children = <Widget>[];

    // If a left icon is provided, add it to the button
    if (leftIcon != null) {
      children.add(Padding(
        padding: EdgeInsets.only(
          right: removePaddings
              ? 0
              : text != null
                  ? (size == ButtonSize.large
                      ? 18
                      : size == ButtonSize.medium
                          ? 12
                          : 9)
                  : rightIcon != null
                      ? (size == ButtonSize.small ? 5 : 10)
                      : 0,
        ),
        child: leftIcon!,
      ));
    }

    // If text is provided, add it to the button
    if (text != null) {
      children.add(Text(
        text!,
        style: (size == ButtonSize.medium
            ? context.labelMedium?.copyWith(
                color: Palette.white,
                fontWeight: FontWeight.w500,
              )
            : size == ButtonSize.small
                ? context.labelSmall?.copyWith(
                    color: Palette.white,
                    fontWeight: FontWeight.w500,
                  )
                : context.labelLarge?.copyWith(
                    color: Palette.white,
                    fontWeight: FontWeight.w500,
                  )),
      ));
    }

    // If a right icon is provided, add it to the button
    if (rightIcon != null) {
      children.add(Padding(
        padding: EdgeInsets.only(
          left: removePaddings
              ? 0
              : text != null
                  ? (size == ButtonSize.large
                      ? 18
                      : size == ButtonSize.medium
                          ? 14
                          : 9)
                  : leftIcon != null
                      ? (size == ButtonSize.small ? 5 : 10)
                      : 0,
        ),
        child: rightIcon!,
      ));
    }

    double paddingHorizontal = removePaddings
        ? 0
        : (leftIcon != null
            ? (size == ButtonSize.large
                ? 24
                : size == ButtonSize.medium
                    ? 16
                    : 8)
            : (size == ButtonSize.large
                ? 24
                : (size == ButtonSize.small && text == null ? 8 : 16)));

    double paddingVertical =
        removePaddings ? 0 : (size == ButtonSize.small ? 8 : 12);

    // Return the final button
    return Container(
      margin: const EdgeInsets.only(top: Sizes.sm),
      child: Opacity(
        opacity: state == ButtonState.disabled ? 0.48 : 1,
        child: RawMaterialButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0,
          focusElevation: 2,
          highlightElevation: 0,
          hoverElevation: 0,
          fillColor: background,
          constraints: const BoxConstraints(),
          onPressed: state == ButtonState.disabled ? null : onPressed,
          shape: RoundedRectangleBorder(
              side: type == ButtonType.primary
                  ? BorderSide.none
                  : BorderSide(
                      color: defaultBorderColor, width: borderLineWidth),
              borderRadius: const BorderRadius.all(Radius.circular(Sizes.xl9))),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              paddingHorizontal,
              paddingVertical,
              paddingHorizontal,
              paddingVertical,
            ),
            child: Row(
              mainAxisSize: autoResize ? MainAxisSize.min : MainAxisSize.max,
              mainAxisAlignment: horizontalAlignment,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
