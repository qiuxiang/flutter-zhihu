import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../types.dart' show Target, ResourceTypeEnum;
import '../../utils.dart';
import '../comments/comments.dart';
import 'content.dart';
import 'icon_item.dart';
import 'video.dart';
import 'vote.dart';

enum Menu { browser, question }

class DetailPage extends StatelessWidget {
  final Target target;

  const DetailPage(this.target);

  @override
  Widget build(BuildContext context) {
    String title;
    final children = <Widget>[];

    switch (target.type) {
      case ResourceTypeEnum.ANSWER:
        title = target.question.title;
        children.addAll([Content(target)]);
        break;
      case ResourceTypeEnum.ARTICLE:
        title = target.title;
        children.addAll([Content(target)]);
        break;
      case ResourceTypeEnum.ZVIDEO:
        children.addAll([Video(target)]);
        title = target.title;
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
            Vote(target),
            const Expanded(child: SizedBox()),
            buildWidget(
              target.thanksCount,
              () => IconItem(Icons.favorite_outline, target.thanksCount, () {}),
            ),
            buildWidget(
              target.visitedCount,
              () => IconItem(Icons.visibility, target.visitedCount, () {}),
            ),
            IconItem(Icons.comment_outlined, target.commentCount, () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                isScrollControlled: true,
                builder: (_) => Comments(target),
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
                    return openBrowser();
                  case Menu.question:
                    return;
                }
              },
              itemBuilder: (_) {
                final items = <PopupMenuItem<Menu>>[];
                if (target.type == ResourceTypeEnum.ANSWER) {
                  items.add(PopupMenuItem(
                    value: Menu.browser,
                    child: Text('查看问题（${target.question.answerCount}）'),
                  ));
                }
                items.add(const PopupMenuItem(
                  value: Menu.browser,
                  child: Text('在浏览器中打开'),
                ));
                return items;
              },
            )
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...children,
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '编辑于：${target.updatedTime.toDateTimeString()}',
                style: Get.textTheme.caption,
              ),
            ),
          ]),
        ),
      ]),
    );
  }

  void openBrowser() {
    switch (target.type) {
      case ResourceTypeEnum.ANSWER:
        launch(
            'https://zhihu.com/question/${target.question.id}/answer/${target.id}');
        break;
      case ResourceTypeEnum.ARTICLE:
        launch('https://zhuanlan.zhihu.com/p/${target.id}');
        break;
      case ResourceTypeEnum.ZVIDEO:
        break;
    }
  }
}
