import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../types.dart' show RecommendDatum, ResourceTypeEnum;
import '../../utils.dart';
import '../comments/comments.dart';
import 'content.dart';
import 'icon_item.dart';
import 'video.dart';

enum Menu { browser }

class DetailPage extends StatelessWidget {
  final RecommendDatum item;

  const DetailPage(this.item);

  @override
  Widget build(BuildContext context) {
    String title;
    final children = <Widget>[];

    switch (item.target.type) {
      case ResourceTypeEnum.ANSWER:
        title = item.target.question.title;
        children.addAll([Content(item)]);
        break;
      case ResourceTypeEnum.ARTICLE:
        title = item.target.title;
        children.addAll([Content(item)]);
        break;
      case ResourceTypeEnum.ZVIDEO:
        children.addAll([Video(item)]);
        title = item.target.title;
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        shadowColor: Colors.transparent,
        backwardsCompatibility: false,
      ),
      backgroundColor: Get.theme.cardColor,
      bottomNavigationBar: Material(
        color: Get.theme.cardColor,
        elevation: 4,
        child: Container(
          height: 50,
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Row(children: [
            Container(
              height: 34,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Get.theme.backgroundColor.withOpacity(0.3),
                borderRadius: const BorderRadius.all(Radius.circular(36)),
              ),
              child: DefaultTextStyle(
                style: Get.textTheme.bodyText1.copyWith(
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
                    child: Text('${item.target.voteupCount}'),
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
            ),
            const Expanded(child: SizedBox()),
            buildWidget(
              item.target.thanksCount,
              () => IconItem(
                  Icons.favorite_outline, item.target.thanksCount, () {}),
            ),
            IconItem(Icons.comment_outlined, item.target.commentCount, () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                isScrollControlled: true,
                builder: (_) => Comments(item.target),
              );
            }),
          ]),
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text(title),
          pinned: true,
          backwardsCompatibility: false,
          actions: [
            // IconButton(icon: const Icon(Icons.more_vert), onPressed: () {},),
            PopupMenuButton<Menu>(
              onSelected: (selected) {
                switch (selected) {
                  case Menu.browser:
                    openBrowser();
                }
              },
              itemBuilder: (_) => [
                const PopupMenuItem(
                  value: Menu.browser,
                  child: Text('在浏览器中打开'),
                ),
              ],
            )
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...children,
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '编辑于：${item.updatedTime.toDateTimeString()}',
                style: Get.textTheme.caption,
              ),
            ),
          ]),
        ),
      ]),
    );
  }

  void openBrowser() {
    switch (item.target.type) {
      case ResourceTypeEnum.ANSWER:
        launch(
            'https://zhihu.com/question/${item.target.question.id}/answer/${item.target.id}');
        break;
      case ResourceTypeEnum.ARTICLE:
        launch('https://zhuanlan.zhihu.com/p/${item.target.id}');
        break;
      case ResourceTypeEnum.ZVIDEO:
        break;
    }
  }
}
