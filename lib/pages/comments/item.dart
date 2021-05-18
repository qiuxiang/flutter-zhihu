import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils.dart';
import '../../widgets/widgets.dart';

class Item extends StatelessWidget {
  final Map item;
  final double avatarSize;

  const Item(this.item, {Key? key, this.avatarSize = 36}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Avatar(item['author']['member']['avatar_url'], avatarSize),
      const SizedBox(width: 8),
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          RichText(
            text: TextSpan(
              text: item['author']['member']['name'],
              style: Get.textTheme.bodyText1,
              children: item['reply_to_author'] == null ? null : buildReply(),
            ),
          ),
          const SizedBox(height: 6),
          HtmlText(item['content']),
          Row(children: [
            Text(
              (item['created_time'] as int).toDateTime(),
              style: Get.textTheme.caption,
            ),
            buildWidget(
              item['featured'],
              () {
                return CupertinoButton(
                  padding: const EdgeInsets.only(bottom: 4, left: 12),
                  onPressed: () {},
                  child: Text('查看回复', style: Get.textTheme.caption),
                );
              },
            ),
            const Expanded(child: SizedBox()),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Row(children: [
                buildWidget(
                  item['vote_count']! > 0,
                  () => Text(
                    '${item['vote_count']}',
                    style: Get.textTheme.caption,
                  ),
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.thumb_up,
                  color: Get.textTheme.caption?.color,
                  size: 14,
                ),
              ]),
            ),
          ]),
        ]),
      ),
      const SizedBox(width: 16),
    ]);
  }

  List<TextSpan> buildReply() {
    return [
      TextSpan(
        text: '  回复  ',
        style: TextStyle(color: Get.textTheme.caption?.color),
      ),
      TextSpan(text: item['reply_to_author']['member']['name']),
    ];
  }
}
