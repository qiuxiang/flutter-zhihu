import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils.dart';
import '../../widgets/widgets.dart';
import '../comments/comments.dart';
import '../questions/questions.dart';
import 'content.dart';
import 'icon_item.dart';
import 'video.dart';
import 'vote.dart';

enum Menu { browser, question }

class DetailPage extends StatelessWidget {
  final Map target;

  const DetailPage(this.target);

  @override
  Widget build(BuildContext context) {
    String? title;
    final children = <Widget>[];

    switch (target['type']) {
      case 'answer':
        title = target['question']['title'];
        children.addAll([Content(target)]);
        break;
      case 'article':
        title = target['title'];
        children.addAll([Content(target)]);
        break;
      case 'zvideo':
        children.addAll([Video(target)]);
        title = target['title'];
    }
    int? updated = target['updated_time'] ?? target['updated'];
    return ScaffoldPage(
      backgroundColor: context.isDarkMode ? null : Get.theme.cardColor,
      bottom: Material(
        color: Get.theme.cardColor,
        elevation: 2,
        child: Container(
          height: 50 + Get.mediaQuery.padding.bottom,
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 8,
            bottom: Get.mediaQuery.padding.bottom,
          ),
          child: Row(children: [
            Vote(target),
            const Expanded(child: SizedBox()),
            buildWidget(
              target['visited_count'],
              () => IconItem(Icons.visibility, target['visited_count'], () {}),
            ),
            buildWidget(
              target['thanks_count'],
              () => IconItem(
                  Icons.favorite_outline, target['thanks_count'], () {}),
            ),
            IconItem(Icons.comment_outlined, target['comment_count'], () {
              Get.bottomSheet(Comments(target), isScrollControlled: true);
            }),
          ]),
        ),
      ),
      slivers: [
        SliverAppBar(
          title: Text(title ?? ''),
          pinned: true,
          backwardsCompatibility: false,
          elevation: 0.5,
          actions: [
            PopupMenuButton<Menu>(
              onSelected: (selected) {
                switch (selected) {
                  case Menu.browser:
                    return openBrowser();
                  case Menu.question:
                    Get.to(() => QuestionsPage(target['question']));
                }
              },
              itemBuilder: (_) {
                final items = <PopupMenuItem<Menu>>[];
                final count = target['question']['answer_count'];
                if (target['type'] == 'answer' && count != null) {
                  items.add(PopupMenuItem(
                      value: Menu.question, child: Text('查看问题 ($count)')));
                }
                items.add(const PopupMenuItem(
                    value: Menu.browser, child: Text('在浏览器中打开')));
                return items;
              },
            )
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...children,
            buildIf(updated, () {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '编辑于：${updated?.toDateTime()}',
                  style: Get.textTheme.caption,
                ),
              );
            }),
          ]),
        ),
      ],
    );
  }

  void openBrowser() {
    switch (target['type']) {
      case 'answer':
        launch(
            'https://zhihu.com/question/${target['question']['id']}/answer/${target['id']}');
        break;
      case 'article':
        launch('https://zhuanlan.zhihu.com/p/${target['id']}');
        break;
      case 'zvideo':
        break;
    }
  }
}
