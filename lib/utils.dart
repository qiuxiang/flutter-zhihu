import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final dateFormat = DateFormat('yyyy MM-dd');
final dateTimeFormat = DateFormat('yyyy MM-dd HH:mm');

extension Int2Date on int {
  String toDate() {
    return dateFormat.format(DateTime.fromMillisecondsSinceEpoch(this * 1000));
  }

  String toDateTime() {
    return dateTimeFormat
        .format(DateTime.fromMillisecondsSinceEpoch(this * 1000));
  }
}

extension ContextExt on BuildContext {
  ColorScheme get colorScheme {
    return Theme.of(this).colorScheme;
  }
}
