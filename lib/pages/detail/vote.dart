import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Vote extends StatelessWidget {
  final Map target;

  const Vote(this.target, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: context.theme.backgroundColor.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(36)),
      ),
      child: DefaultTextStyle(
        style: context.textTheme.bodyText1!.copyWith(
          color: context.theme.accentColor,
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
                color: context.theme.accentColor,
              ),
            ),
          ),
          const Text('赞同'),
          const SizedBox(width: 2),
          Container(
            width: 42,
            margin: const EdgeInsets.only(top: 3),
            child: Text('${target['voteup_count'] ?? target['vote_count']}'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Transform.rotate(
              angle: 90 * math.pi / 180,
              child: Icon(
                Icons.play_arrow_rounded,
                color: context.theme.accentColor,
              ),
            ),
          ),
          const SizedBox(width: 4),
        ]),
      ),
    );
  }
}
