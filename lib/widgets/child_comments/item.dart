import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../types.dart' show ChildCommentElement;
import '../../utils.dart';
import '../widgets.dart';

class Item extends StatelessWidget {
  final ChildCommentElement item;
  final double avatarSize;
  const Item(this.item, {Key key, this.avatarSize = 36}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: avatarSize,
        height: avatarSize,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(avatarSize)),
        ),
        child: CachedNetworkImage(
          imageUrl: item.author.member.avatarUrl,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          RichText(
            text: TextSpan(
              text: item.author.member.name,
              style: Get.textTheme.bodyText1,
              children: item.replyToAuthor == null ? null : buildReply(),
            ),
          ),
          const SizedBox(height: 6),
          HtmlText(item.content),
          Row(children: [
            Expanded(
              child: Text(
                item.createdTime.toDateTimeString(),
                style: Get.textTheme.caption,
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Row(children: [
                buildWidget(
                  item.voteCount > 0,
                  () => Text(
                    '${item.voteCount}',
                    style: Get.textTheme.caption,
                  ),
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.thumb_up,
                  color: Get.textTheme.caption.color,
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
        style: TextStyle(color: Get.textTheme.caption.color),
      ),
      TextSpan(text: item.replyToAuthor.member.name),
    ];
  }
}
