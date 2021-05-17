import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../types.dart';

class Vote extends StatelessWidget {
  final Target target;
  const Vote(this.target, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Get.theme.backgroundColor.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(36)),
      ),
      child: DefaultTextStyle(
        style: Get.textTheme.bodyText1!.copyWith(
          color: Get.theme.accentColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        child: Row(children: [
          const SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Transform.rotate(
              angle: 270 * math.pi / 180,
              child: Icon(
                Icons.play_arrow_rounded,
                color: Get.theme.accentColor,
              ),
            ),
          ),
          const Text('赞同'),
          const SizedBox(width: 2),
          Container(
            width: 42,
            margin: const EdgeInsets.only(top: 3),
            child: Text('${target.voteupCount ?? target.voteCount}'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Transform.rotate(
              angle: 90 * math.pi / 180,
              child: Icon(
                Icons.play_arrow_rounded,
                color: Get.theme.accentColor,
              ),
            ),
          ),
          const SizedBox(width: 4),
        ]),
      ),
    );
  }
}
