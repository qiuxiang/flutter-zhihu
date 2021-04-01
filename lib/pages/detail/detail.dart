import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../types.dart' show Target, ResourceTypeEnum;
import '../../utils.dart';
import '../comments/comments.dart';
import '../question/question.dart';
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
    final updated = target.updatedTime ?? target.updated;
    return Scaffold(
      backgroundColor: Get.isDarkMode ? null : Get.theme?.cardColor,
      bottomNavigationBar: Material(
        color: Get.theme?.cardColor,
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
              target.visitedCount,
              () => IconItem(Icons.visibility, target.visitedCount, () {}),
            ),
            buildWidget(
              target.thanksCount,
              () => IconItem(Icons.favorite_outline, target.thanksCount, () {}),
            ),
            IconItem(Icons.comment_outlined, target.commentCount, () {
              Get.bottomSheet(Comments(target), isScrollControlled: true);
            }),
          ]),
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text(title),
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
                    Get.to(QuestionPage(target.question));
                }
              },
              itemBuilder: (_) {
                print(target.toJson());
                final items = <PopupMenuItem<Menu>>[];
                if (target.type == ResourceTypeEnum.ANSWER &&
                    target.question.answerCount != null) {
                  items.add(PopupMenuItem(
                    value: Menu.question,
                    child: Text('查看问题 (${target.question.answerCount})'),
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
            buildIf(updated, () {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '编辑于：${(updated).toDateTimeString()}',
                  style: Get.textTheme.caption,
                ),
              );
            }),
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
