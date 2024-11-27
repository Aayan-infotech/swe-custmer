import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/utils.dart';



extension $StringExtension on String {

  String toFormattedPrice() {
    int number = double.parse(this).toInt();
    if (number > -1000 && number < 1000) return number.toString();
    final String digits = number.abs().toString();
    final StringBuffer result = StringBuffer(number < 0 ? '-' : '');
    final int maxDigitIndex = digits.length - 1;
    for (int i = 0; i <= maxDigitIndex; i += 1) {
      result.write(digits[i]);
      if (i < maxDigitIndex && (maxDigitIndex - i) % 3 == 0) result.write(',');
    }
    return "$result.${(double.parse(this) - number).toStringAsFixed(2).substring(2)}";
  }

  String toJSON() {
    var value = this;
    try {
      value = const JsonEncoder.withIndent("    ").convert(this);
    } catch (e) {
      e.printError();
      value = toString();
    }
    return value;
  }
}

extension $MapExt on Map<String, dynamic> {
  String toJSON() {
    String value ;
    try {
      value = const JsonEncoder.withIndent("    ").convert(this);
    } catch (e) {
      e.printError();
      value = toString();
    }
    return value;
  }
}

extension $BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  EdgeInsets get mediaQueryPadding => MediaQuery.of(this).padding;

  // double get height => mediaQuery.size.height;
  //
  // double get width => mediaQuery.size.width;

  double get topPadding => mediaQuery.padding.top;

  double get bottomPadding => mediaQuery.padding.bottom;

  double get topInset => mediaQuery.viewInsets.top;

  double get bottomInset => mediaQuery.viewInsets.bottom;

  Object? get args => ModalRoute.of(this)?.settings.arguments;

  // TextDirection get textDirection => Directionality.of(this);

  void hideKeyboard() {
    final currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}

extension $NullableStringExtension on String? {
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;

  int toInt() {
    return this == null ? 0 : int.tryParse(this!) ?? 0;
  }

  double toDouble() {
    return this == null ? 0 : double.tryParse(this!) ?? 0.0;
  }
}



bool? isResponseBlank(dynamic value) {
  if (value is String) {
    return value.toString().trim().isEmpty;
  }
  if (value is Iterable || value is Map) {
    return value.isEmpty as bool?;
  }
  return false;
}

extension MyIterable<E> on Iterable<E> {
  Iterable<E> sortedBy(Comparable Function(E e) key) => toList()..sort((a, b) => key(a).compareTo(key(b)));
}


