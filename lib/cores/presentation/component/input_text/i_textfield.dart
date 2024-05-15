import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sipaias_fun_mobile/cores/extensions/context_extensions.dart';
import 'package:sipaias_fun_mobile/cores/styles/input_style/i_input_decoration.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_colors.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_sizes.dart';

class ITextField extends StatelessWidget {
  final String label;
  final String? labelNote;
  final String note;
  final String? customErrorText;
  final String? errorText;
  final String? infoText;
  final TextStyle? labelStyle;
  final bool fieldRequired;
  final double? borderRadius;
  final double? paddingBottomErrorText;
  final Widget Function(BuildContext context) textFieldBuilder;
  final bool textFieldOnly;

  const ITextField({
    super.key,
    required this.label,
    this.note = "",
    this.labelNote = "",
    this.borderRadius,
    this.customErrorText,
    this.errorText,
    this.infoText,
    this.labelStyle,
    this.fieldRequired = false,
    this.paddingBottomErrorText,
    this.textFieldOnly = false,
    required this.textFieldBuilder,
  });

  factory ITextField._template(
      {Key? key,
      required String label,
      String note = "",
      String? customErrorText,
      String? errorText,
      String? infoText,
      String? labelNote = "",
      VoidCallback? onTap,
      TextInputType? keyboardType,
      bool autofocus = false,
      bool readOnly = false,
      String? Function(String?)? validator,
      TextInputAction? textInputAction,
      required TextEditingController? controller,
      int? maxLine = 1,
      int? maxLength,
      TextCapitalization textCapitalization = TextCapitalization.words,
      InputDecorationType inputDecorationType = InputDecorationType.outline,
      Function(String value)? onChanged,
      Function(String value)? onFieldSubmitted,
      TextStyle? labelStyle,
      List<TextInputFormatter>? inputFormatters,
      TextAlign textAlign = TextAlign.start,
      InputDecoration? decoration,
      TextStyle? style,
      bool fieldRequired = false,
      bool obscureText = false,
      double? paddingBottomErrorText = Sizes.xs,
      FocusNode? focusNode,
      bool enableInteractiveSelection = true,
      bool textFieldOnly = false,
      Widget Function(BuildContext, EditableTextState)? contextMenuBuilder}) {
    return ITextField(
      key: key,
      label: label,
      note: note,
      labelNote: labelNote,
      customErrorText: customErrorText,
      errorText: errorText,
      infoText: infoText,
      labelStyle: labelStyle,
      fieldRequired: fieldRequired,
      paddingBottomErrorText: paddingBottomErrorText,
      textFieldOnly: textFieldOnly,
      textFieldBuilder: (BuildContext context) {
        return TextFormField(
          textAlign: textAlign,
          readOnly: readOnly,
          cursorHeight: 23,
          autofocus: autofocus,
          decoration: decoration,
          inputFormatters: inputFormatters ??
              [
                FilteringTextInputFormatter.deny(
                  RegExp(
                    r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|'
                    r'\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
                  ),
                )
              ],
          style: style,
          key: key,
          validator: validator,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          controller: controller,
          textCapitalization: textCapitalization,
          onTap: onTap,
          obscureText: obscureText,
          onChanged: (value) {
            if (value.endsWith("  ")) {
              var data = value.substring(0, value.length - 1);
              controller?.text = data;
              controller?.selection =
                  TextSelection.collapsed(offset: data.length);
            }
            if (onChanged != null) {
              onChanged(value);
            }
          },
          onFieldSubmitted: (value) {
            if (onFieldSubmitted != null) {
              onFieldSubmitted(value);
            }
          },
          maxLines: maxLine,
          maxLength: maxLength,
          autocorrect: true,
          focusNode: focusNode,
          enableInteractiveSelection: enableInteractiveSelection,
          contextMenuBuilder: contextMenuBuilder ??
              (BuildContext context, EditableTextState editableTextState) {
                return AdaptiveTextSelectionToolbar.editable(
                  anchors: editableTextState.contextMenuAnchors,
                  clipboardStatus: ClipboardStatus.pasteable,
                  // to apply the normal behavior when click on copy (copy in clipboard close toolbar)
                  // use an empty function `() {}` to hide this option from the toolbar
                  onCopy: () => editableTextState
                      .copySelection(SelectionChangedCause.toolbar),
                  // to apply the normal behavior when click on cut
                  onCut: () => editableTextState
                      .cutSelection(SelectionChangedCause.toolbar),
                  onPaste: () {
                    // HERE will be called when the paste button is clicked in the toolbar
                    // apply your own logic here

                    // to apply the normal behavior when click on paste (add in input and close toolbar)
                    editableTextState.pasteText(SelectionChangedCause.tap);
                  },
                  // to apply the normal behavior when click on select all
                  onSelectAll: () => editableTextState
                      .selectAll(SelectionChangedCause.toolbar),
                  onLookUp: () {},
                  onSearchWeb: () {},
                  onShare: () {},
                  onLiveTextInput: () {},
                );
              },
        );
      },
    );
  }

  factory ITextField.primary(
      {Key? key,
      required String label,
      String note = "",
      String? customErrorText,
      String? infoText,
      String? labelNote = "",
      double? borderRadius,
      VoidCallback? onTap,
      TextInputType? keyboardType,
      bool autofocus = false,
      bool readOnly = false,
      bool isReadyOnlyKeepColor = false,
      String? Function(String?)? validator,
      bool fieldRequired = false,
      TextInputAction? textInputAction,
      Widget? suffixIcon,
      Widget? prefixIcon,
      String? hintText,
      bool obscureText = false,
      required TextEditingController? controller,
      int? maxLine = 1,
      int? maxLength,
      TextCapitalization textCapitalization = TextCapitalization.words,
      InputDecorationType inputDecorationType = InputDecorationType.outline,
      Function(String value)? onChanged,
      Function(String value)? onFieldSubmitted,
      TextStyle? labelStyle,
      List<TextInputFormatter>? inputFormatters,
      String? errorText,
      TextStyle? style,
      bool isErrorWithoutText = false,
      TextStyle? hintStyle,
      FocusNode? focusNode,
      double? paddingBottomErrorText,
      bool enableInteractiveSelection = true,
      Widget Function(BuildContext, EditableTextState)? contextMenuBuilder}) {
    return ITextField._template(
        inputFormatters: inputFormatters,
        key: key,
        label: label,
        labelNote: labelNote,
        errorText: errorText,
        note: note,
        customErrorText: customErrorText,
        infoText: infoText,
        onTap: onTap,
        obscureText: obscureText,
        maxLine: maxLine,
        keyboardType: keyboardType,
        autofocus: autofocus,
        readOnly: readOnly,
        textCapitalization: textCapitalization,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        inputDecorationType: inputDecorationType,
        paddingBottomErrorText: paddingBottomErrorText,
        decoration: IInputDecoration.primary(
          errorMaxLines: 2,
          hintText: hintText,
          suffixIcon: suffixIcon,
          inputDecorationType: inputDecorationType,
          fillColor: onTap != null
              ? Palette.white
              : readOnly
                  ? isReadyOnlyKeepColor
                      ? Palette.transparent
                      : Palette.neutral400
                  : Palette.neutral100,
          prefixIcon: prefixIcon,
          errorText: errorText,
          borderRadius: borderRadius,
          isErrorWithoutText: isErrorWithoutText,
          hintStyle: hintStyle,
        ),
        fieldRequired: fieldRequired,
        validator: validator,
        textInputAction: textInputAction,
        controller: controller,
        labelStyle: labelStyle,
        maxLength: maxLength,
        style: style,
        focusNode: focusNode,
        enableInteractiveSelection: enableInteractiveSelection,
        contextMenuBuilder: contextMenuBuilder);
  }

  @override
  Widget build(BuildContext context) {
    if (textFieldOnly) {
      return textFieldBuilder(context);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(context),
        context.sbHeight(size: context.padding1),
        textFieldBuilder(context),
        (errorText?.isNotEmpty == true) ||
                (infoText?.isNotEmpty == true) ||
                customErrorText?.isNotEmpty == true
            ? const SizedBox()
            : context.sbHeight(size: paddingBottomErrorText),
        Align(alignment: Alignment.centerLeft, child: _errorText(context)),
        Align(alignment: Alignment.centerLeft, child: _infoText(context)),
        note.isNotEmpty == true
            ? context.sbHeight(size: context.padding0)
            : const SizedBox(),
        _note(context)
      ],
    );
  }

  Widget _label(BuildContext context) {
    return label.isEmpty
        ? const SizedBox()
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: labelStyle ??
                    context.labelMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              fieldRequired
                  ? Text(
                      "*",
                      style: context.bodySmall,
                    )
                  : const SizedBox(),
              labelNote!.isEmpty
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        labelNote!,
                        style: context.bodySmall
                            ?.copyWith(color: Palette.green400),
                      ),
                    )
            ],
          );
  }

  Widget _note(BuildContext context) {
    return note.isEmpty
        ? const SizedBox()
        : Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Text("Note: ", style: context.bodySmall),
              Expanded(
                child: Text(
                  note,
                  style: context.labelSmall
                      ?.copyWith(fontSize: 8, color: Palette.gray400),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          );
  }

  Widget _errorText(BuildContext context) {
    return customErrorText == null
        ? const SizedBox()
        : Padding(
            padding: EdgeInsets.only(left: context.padding2, top: 7),
            child: Text(
              customErrorText!,
              style: context.bodySmall?.copyWith(
                color: Palette.red500,
              ),
              textAlign: TextAlign.left,
            ),
          );
  }

  Widget _infoText(BuildContext context) {
    return (infoText == null) ||
            (errorText?.isNotEmpty == true) ||
            (customErrorText?.isNotEmpty == true)
        ? const SizedBox()
        : Padding(
            padding: EdgeInsets.only(left: context.padding2, top: 7),
            child: Text(
              infoText!,
              style: context.bodySmall?.copyWith(color: Palette.blue500),
              textAlign: TextAlign.left,
            ),
          );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}
