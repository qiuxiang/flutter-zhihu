import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildIf(dynamic value, Widget Function() builder) {
  if (value == null || (value is bool && !value)) {
    return const SizedBox();
  }
  return builder();
}

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

Widget buildWidget(dynamic value, Widget Function() builder) {
  if (value == null) return const SizedBox();
  if (value is bool && !value) return const SizedBox();

  return builder();
}
