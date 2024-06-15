import 'package:flutter/material.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';

import 'common_text_view.dart';

class CommonButton extends StatelessWidget {
  final String? label;
  final EdgeInsetsGeometry? mPadding;
  final VoidCallback? onPressed;
  final double textSize;
  final Color labelColor;
  final Widget? child;
  final Color? bgColor;
  final FontWeight fontWeight;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;

  static const pad = EdgeInsets.all(16);

  const CommonButton({
    required this.onPressed,
    this.label,
    this.child,
    this.mPadding = pad,
    this.textSize = 14.0,
    this.labelColor = secondary,
    this.bgColor = primary,
    this.fontWeight = FontWeight.bold,
    this.borderRadius = 8,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    super.key,
  }) : assert(child == null || label == null, "cannot assign both at once.");

  @override
  Widget build(BuildContext context) {
    var mStyle = ButtonStyle(
      padding: WidgetStateProperty.all(mPadding ?? pad),
      // backgroundColor: WidgetStateProperty.all(bgColor ?? secondary),
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
      shadowColor: WidgetStateProperty.all(Colors.transparent),
      elevation: WidgetStateProperty.all(0),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        // boxShadow: const [BoxShadow(
        //       color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
        // ],
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        clipBehavior: Clip.hardEdge,
        style: mStyle,
        child: Center(
          child: child ??
              CommonText(
                label ?? "Click",
                size: textSize,
                color: labelColor,
                textAlign: TextAlign.center,
                fontWeight: fontWeight,
              ),
        ),
      ),
    );
  }
}
