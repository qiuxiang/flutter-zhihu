import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils.dart';
import '../../widgets/widgets.dart';
import '../detail/detail.dart';
import '../recommends/stats_item.dart';
import 'state.dart';

class QuestionsPage extends StatelessWidget {
  final Map question;

  const QuestionsPage(this.question);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => QuestionState());
    final state = Get.find<QuestionState>();
    if (state.question != question) {
      state.question = question;
      state.init();
    }

    return ScaffoldPage(slivers: [
      SliverAppBar(
        title: Text(question['title']),
        pinned: true,
        actions: [
          PopupMenuButton<Menu>(
            onSelected: (selected) {
              switch (selected) {
                case Menu.browser:
                  launch('https://zhihu.com/question/${question['id']}');
                  break;
                default:
                  break;
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
      Obx(() {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) {
              if (i == state.answers.length) {
                if (state.end.value) return const SizedBox();

                state.fetch();
                return const SizedBox(height: 64, child: Loading());
              }
              final item = state.answers[i];
              return Card(
                margin: const EdgeInsets.only(top: 8),
                shape: const RoundedRectangleBorder(),
                child: InkWell(
                  onTap: () => Get.to(() => DetailPage(item)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: [
                      Row(children: [
                        Avatar(item['author']['avatar_url'], 20),
                        const SizedBox(width: 4),
                        Text(item['author']['name'],
                            style: context.textTheme.caption),
                      ]),
                      const SizedBox(height: 8),
                      Left(Text(item['excerpt'])),
                      const SizedBox(height: 12),
                      DefaultTextStyle(
                        style: context.textTheme.caption!,
                        child: Row(children: [
                          StatsItem(Icons.thumb_up, item['voteup_count']),
                          StatsItem(Icons.comment, item['comment_count']),
                          Expanded(
                            child: Right(
                              Text((item['updated_time'] as int).toDateTime()),
                            ),
                          ),
                        ]),
                      ),
                    ]),
                  ),
                ),
              );
            },
            childCount: state.answers.length + 1,
          ),
        );
      }),
    ]);
  }
}
