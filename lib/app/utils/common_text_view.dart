import 'package:flutter/material.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';

import 'constants.dart';


class CommonText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool isItalic;
  final double? height;
  final double? letterSpacing;
  final FontWeight fontWeight;
  final VoidCallback? onTap;
  final String fontFamily;
  final bool isUnderLine;

  const CommonText(
      this.text, {
        this.size = 12,
        this.color = primary,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.isItalic = false,
        this.height,
        this.letterSpacing,
        this.fontWeight = FontWeight.normal,
        this.onTap,
        this.fontFamily = mFontFamily,
        this.isUnderLine = false,
        super.key,
      });

  const CommonText.extraBold(
      this.text, {
        this.size = 12,
        this.color = primary,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.isItalic = false,
        this.height,
        this.letterSpacing,
        this.onTap,
        this.fontFamily = mFontFamily,
        this.isUnderLine = false,
        super.key,
      })  : fontWeight = FontWeight.w900;

  const CommonText.bold(
      this.text, {
        this.size = 12,
        this.color = primary,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.isItalic = false,
        this.height,
        this.letterSpacing,
        this.onTap,
        this.fontFamily = mFontFamily,
        this.isUnderLine = false,
        super.key,
      })  : fontWeight = FontWeight.w700;

  const CommonText.semiBold(
      this.text, {
        this.size = 12,
        this.color = primary,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.isItalic = false,
        this.height,
        this.letterSpacing,
        this.onTap,
        this.fontFamily = mFontFamily,
        this.isUnderLine = false,
        super.key,
      })  : fontWeight = FontWeight.w600;

  const CommonText.medium(
      this.text, {
        this.size = 12,
        this.color = shadow,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.isItalic = false,
        this.height,
        this.letterSpacing,
        this.onTap,
        this.fontFamily = mFontFamily,
        this.isUnderLine = false,
        super.key,
      })  : fontWeight = FontWeight.w500;

  const CommonText.regular(
      this.text, {
        this.size = 12,
        this.color = primary,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.isItalic = false,
        this.height = 1.5,
        this.letterSpacing,
        this.onTap,
        this.fontFamily = mFontFamily,
        this.isUnderLine = false,
        super.key,
      })  : fontWeight = FontWeight.w400;

  const CommonText.light(
      this.text, {
        this.size = 12,
        this.color = primary,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.isItalic = false,
        this.height = 1.5,
        this.letterSpacing,
        this.onTap,
        this.fontFamily = mFontFamily,
        this.isUnderLine = false,
        super.key,
      })  : fontWeight = FontWeight.w300;

  @override
  Widget build(BuildContext context) {
    var child = InkWell(
      onTap: onTap,
      child: Text(
        text,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        style: TextStyle(
            fontFamily: fontFamily,
            color: color,
            fontSize: size,
            fontStyle: isItalic ? FontStyle.italic : null,
            fontWeight: fontWeight,
            height: height,
            letterSpacing: letterSpacing,
            decoration: isUnderLine ? TextDecoration.underline : null,
            decorationThickness: 1,
            decorationColor: secondary),
      ),
    );

    return child;
    // return onTap != null ? GestureDetector(onTap: onTap, child: child) : child;
  }
}