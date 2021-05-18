import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatsItem extends StatelessWidget {
  final IconData icon;
  final int? value;

  const StatsItem(this.icon, [this.value = 0]);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon, size: 14, color: Get.textTheme.caption?.color),
      const SizedBox(width: 4),
      Text('$value'),
      const SizedBox(width: 12),
    ]);
  }
}
