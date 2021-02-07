import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

Widget buildIf(dynamic value, Widget Function() builder) {
  if (value == null || (value is bool && !value)) {
    return const SizedBox();
  }
  return builder();
}

final dateFormat = DateFormat('yyyy MM-dd');
final dateTimeFormat = DateFormat('yyyy MM-dd HH:mm');

extension Int2Date on int {
  String toDateString() {
    return dateFormat.format(DateTime.fromMillisecondsSinceEpoch(this * 1000));
  }

  String toDateTimeString() {
    return dateTimeFormat
        .format(DateTime.fromMillisecondsSinceEpoch(this * 1000));
  }
}
