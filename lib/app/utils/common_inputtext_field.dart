
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';

import 'constants.dart';


class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscure;
  final TextInputAction inputAction;
  final FormFieldValidator<String>? validator;
  final GlobalKey<FormFieldState>? _fieldKey;
  final ValueChanged<String>? fieldSubmitted;
  final FocusNode? focus;
  final ValueChanged<String>? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? prefixImg;
  final Widget? suffixIcon;
  final int maxLines;
  final int minLines;
  final List<TextInputFormatter> inputFormatters;
  final bool isReadOnly;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final BoxConstraints iconConstraints;
  final String obscuringCharacter;
  final Iterable<String>? autofillHints;
  final bool isCanSee;
  final Widget Function(BuildContext, {required int currentLength, required bool isFocused, required int? maxLength})? buildCounter;
  final TextCapitalization? textCapitalization;
  final Color? borderColor;
  final Color? bgColor;
  final double mPadding;

  const CommonTextField({
    required this.controller,
    this.labelText = "",
    GlobalKey<FormFieldState>? globalKey,
    this.keyboardType = TextInputType.text,
    this.obscure = false,
    this.inputAction = TextInputAction.next,
    this.validator,
    this.fieldSubmitted,
    this.focus,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.prefixImg,
    this.suffixIcon,
    this.inputFormatters = const [],
    this.maxLines = 1,
    this.minLines = 1,
    this.isReadOnly = false,
    this.hintText = "",
    this.textAlign = TextAlign.start,
    this.onTap,
    this.iconConstraints = const BoxConstraints(maxWidth: 160),
    super.key,
    this.obscuringCharacter = '•',
    this.autofillHints,
    this.isCanSee = false,
    this.buildCounter,
    this.textCapitalization,
    this.borderColor = Colors.transparent,
    this.bgColor = Colors.transparent,
    this.mPadding = 0

  }) : _fieldKey = globalKey;

  @override
  Widget build(BuildContext context) {

    //var borderStyle = OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: borderColor!, width: 0.0));
    //var focusedBorderStyle = OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: borderColor!, width: 0.0));


    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextFormField(
          onTap: onTap,
          key: _fieldKey,
          validator: validator,
          obscuringCharacter: obscuringCharacter,
          textInputAction: inputAction,
          onFieldSubmitted: fieldSubmitted,
          controller: controller,
          focusNode: focus,
          obscureText: obscure,
          onChanged: onChanged,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          buildCounter: buildCounter,
          style: const TextStyle(color:  primary, fontWeight: FontWeight.w500, fontSize: 14, fontFamily: mFontFamily),
          textAlign: textAlign,
          maxLines: maxLines,
          minLines: minLines,
          readOnly: isReadOnly,
          cursorWidth: 1,
          cursorColor: onPrimary,
          inputFormatters: inputFormatters,
          autofillHints: autofillHints,
          decoration: InputDecoration(
            contentPadding:  EdgeInsets.all(mPadding).copyWith(left: 20),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            labelText: labelText,
            prefix: prefix,
            suffix: suffix,
            errorMaxLines: 4,
            labelStyle: const TextStyle(color: onPrimary,fontWeight: FontWeight.w500,fontSize: 16,fontFamily: mFontFamily),
            hintStyle: TextStyle(color: onSurfaceVariant.withOpacity(0.7), fontWeight: FontWeight.w500, fontSize: 12, fontFamily: mFontFamily),
            border:   OutlineInputBorder(borderSide: const BorderSide(color: onPrimary,width: 1),borderRadius: BorderRadius.circular(20)),
            errorBorder:  OutlineInputBorder(borderSide: const BorderSide(color: onPrimary,width: 1),borderRadius: BorderRadius.circular(20)),
            focusedBorder:  OutlineInputBorder(borderSide: const BorderSide(color: onPrimary,width: 1),borderRadius: BorderRadius.circular(20)),
            focusedErrorBorder :  OutlineInputBorder(borderSide: const BorderSide(color: onPrimary,width: 1),borderRadius: BorderRadius.circular(20)),
            enabledBorder:  OutlineInputBorder(borderSide: const BorderSide(color: onPrimary,width: 1),borderRadius: BorderRadius.circular(20)),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            fillColor: Colors.transparent,
            filled: false,
            prefixIconConstraints: iconConstraints,
            suffixIconConstraints: iconConstraints,
          ),
        ),
        Positioned(
          top: 10,
          left: -24,
          bottom: 10,
          child: CircleAvatar(
          backgroundColor: onPrimary,
           maxRadius: 24,
            child:  prefixImg,
          ),
        )
      ],
      // child: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //
      //   ],
      // ),
    );
  }
}