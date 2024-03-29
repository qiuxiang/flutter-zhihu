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

    title = target['title'] ?? target['question']['title'];
    if (isVideo(target)) children.add(Video(target));
    if (target['content']?.isNotEmpty ?? false) children.add(Content(target));

    int? updated = target['updated_time'] ?? target['updated'];
    final backgroundColor = context.isDarkMode
        ? context.theme.scaffoldBackgroundColor
        : context.theme.cardColor;
    return ScaffoldPage(
      appBar: AppBar(
        toolbarHeight: 0,
        shadowColor: Colors.transparent,
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      bottom: Material(
        color: context.theme.cardColor,
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
            if (target['visited_count'] != null)
              IconItem(Icons.visibility, target['visited_count'], () {}),
            if (target['thanks_count'] != null)
              IconItem(Icons.favorite_outline, target['thanks_count'], () {}),
            IconItem(Icons.comment_outlined, target['comment_count'], () {
              Get.bottomSheet(Comments(target), isScrollControlled: true);
              // showModalBottomSheet(
              //   context: context,
              //   builder: (context) => Comments(target),
              //   isScrollControlled: true,
              // );
            }),
          ]),
        ),
      ),
      slivers: [
        SliverAppBar(backgroundColor: backgroundColor, actions: [
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
              final count = target['question']?['answer_count'];
              if (target['type'] == 'answer' && count != null) {
                items.add(PopupMenuItem(
                    value: Menu.question, child: Text('查看问题 ($count)')));
              }
              items.add(const PopupMenuItem(
                  value: Menu.browser, child: Text('在浏览器中打开')));
              return items;
            },
          )
        ]),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(title ?? '', style: context.textTheme.headline6),
            ),
            const SizedBox(height: 16),
            ...children,
            if (updated != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '编辑于：${updated.toDateTime()}',
                  style: context.textTheme.caption,
                ),
              ),
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
        launch('https://zhihu.com/zvideo/${target['id']}');
        break;
    }
  }
}
