import 'package:competition/config/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/config/resoureces/my_text_styles.dart';
import 'package:get/get.dart';
import '../../utils/my_check_theme.dart';

class MyTextField extends StatefulWidget {
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  final keyForm;

  // final void Function(String?)? onSave;

  final TextEditingController? controller;
  final bool autoFocus;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int? maxLength;
  final int? maxLines;
  final bool obscureText;
  final String? suffixText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labelText;
  final String? errorText;
  final TextStyle? labelStyle;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final double? width;
  final double heightPadding;
  final BorderRadius? borderRadius;
  final FloatingLabelBehavior floatingLabelBehavior;
  final TextAlign textAlign;
  final String? helperText;
  final TextStyle? hintStyle;
  final TextStyle? helperStyle;
  final bool? filled;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Function(String)? onFieldSubmitted;
  final bool readOnly;
  final void Function()? onTap;
  final bool enableInteractiveSelection;
  final FocusNode? focusNode;
  final int minLines;
  final TextStyle? style;
  final void Function(PointerDownEvent)? onTapOutside;

  const MyTextField({
    super.key,
    this.keyForm,
    this.minLines = 1,
    this.onFieldSubmitted,
    this.maxLength,
    this.autoFocus = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChange,
    this.textInputAction = TextInputAction.done,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.hintText = '',
    this.labelText,
    this.inputFormatters,
    this.validator,
    // this.onSave,
    this.borderRadius,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.width,
    this.textAlign = TextAlign.center,
    this.helperText,
    this.heightPadding = 8,
    this.hintStyle,
    this.filled,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.readOnly = false,
    this.onTap,
    this.enableInteractiveSelection = true,
    this.focusNode,
    this.style,
    this.suffixText,
    this.helperStyle,
    this.labelStyle,
    this.onTapOutside,
    this.errorText,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late final FocusNode _focusNode;

  void changeState() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(changeState);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode
      ..removeListener(changeState)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.keyForm,
      focusNode: _focusNode,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      onTap: widget.onTap == null
          ? () {
              if (widget.controller!.selection ==
                  TextSelection.fromPosition(
                      TextPosition(offset: widget.controller!.text.length - 1))) {
                widget.controller!.selection = TextSelection.fromPosition(
                    TextPosition(offset: widget.controller!.text.length));
              }
            }
          : widget.onTap!,
      readOnly: widget.readOnly,
      style: widget.style ??
          MyTextStyle.style(context: context,
            size: MyFontSize.medium,
            weight: MyFontWeight.normal,
            mode: context.theme.backgroundColor
          ),
      decoration: InputDecoration(
        isDense: true,
        filled: widget.filled??true,
        fillColor: widget.fillColor??MyColor.nearShadeLightFb,
        contentPadding:
            EdgeInsets.symmetric(vertical: widget.heightPadding, horizontal: 10),
        hintText: widget.hintText,
        suffixText: widget.suffixText,
        suffixStyle:
            MyTextStyle.style(context: context,size: MyFontSize.small, weight: MyFontWeight.normal),
        hintStyle: widget.hintStyle ??
            MyTextStyle.style(context: context,
                mode: MyColor.slightlyDarker,
                size: MyFontSize.medium,
                weight: MyFontWeight.normal),
        labelText: widget.labelText,
        labelStyle: widget.labelStyle ??
            MyTextStyle.style(context: context,
              mode: _focusNode.hasFocus
                  ? myCheckTheme(context,MyColor.white, MyColor.black)
                  : MyColor.slightlyDarker,
              size: MyFontSize.small,
              weight: MyFontWeight.normal,
            ),
        helperText: widget.helperText,
        helperStyle: widget.helperStyle ??
            MyTextStyle.style(context: context,size: MyFontSize.small, weight: MyFontWeight.normal),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1,
            color: MyColor.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1,
            color: MyColor.red,
          ),
        ),
        errorText: widget.errorText,
        errorStyle: MyTextStyle.style(context: context,
          mode: MyColor.red,
          size: MyFontSize.small,
          weight: MyFontWeight.normal,
        ),
        floatingLabelBehavior: widget.floatingLabelBehavior,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: widget.borderColor ?? MyColor.transparent,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: MyColor.transparent,
            width: 1,
          ),
        ),
        counterText: '',
      ),
      textAlign: widget.textAlign,
      validator: widget.validator,
      // onSaved: onSave!,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      onChanged: widget.onChange,
      controller: widget.controller,
      autofocus: widget.autoFocus,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      autocorrect: false,
      maxLength: widget.maxLength,
      obscureText: widget.obscureText,
      textDirection: TextDirection.rtl,
      inputFormatters: widget.inputFormatters,
      onFieldSubmitted: widget.onFieldSubmitted,
      onTapOutside: (event) =>
          widget.onTapOutside ?? FocusManager.instance.primaryFocus?.unfocus(),
      cursorColor: MyColor.shadeBlack400,
    );
  }
}
