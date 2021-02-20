import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../types.dart' show Question;
import '../../utils.dart';
import '../../widgets/widgets.dart';
import '../detail/detail.dart';
import '../recommend/stats_item.dart';
import 'state.dart';

class QuestionPage extends StatelessWidget {
  final Question question;
  const QuestionPage(this.question, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => QuestionState());
    final state = Get.find<QuestionState>();
    if (state.question != question) {
      state.question = question;
      state.init();
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        shadowColor: Colors.transparent,
        backwardsCompatibility: false,
      ),
      backgroundColor: Get.theme.cardColor,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text(question.title),
          pinned: true,
          backwardsCompatibility: false,
        ),
        Obx(() {
          print(state.answers.length);
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) {
                if (i == state.answers.length) {
                  if (state.end.value) return const SizedBox();

                  state.fetch();
                  return const SizedBox(height: 64, child: Loading());
                }
                final item = state.answers[i];
                return Column(children: [
                  const Divider(height: 0),
                  InkWell(
                    onTap: () => Get.to(DetailPage(item)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(children: [
                        Row(children: [
                          Avatar(item.author.avatarUrl, 20),
                          const SizedBox(width: 4),
                          Text(item.author.name, style: Get.textTheme.caption),
                        ]),
                        const SizedBox(height: 8),
                        Left(Text(item.excerpt)),
                        const SizedBox(height: 12),
                        DefaultTextStyle(
                          style: Get.textTheme.caption,
                          child: Row(children: [
                            StatsItem(Icons.thumb_up, item.voteupCount),
                            StatsItem(Icons.comment, item.commentCount),
                            Expanded(
                              child: Right(
                                Text(item.updatedTime.toDateTimeString()),
                              ),
                            ),
                          ]),
                        ),
                      ]),
                    ),
                  ),
                ]);
              },
              childCount: state.answers.length + 1,
            ),
          );
        }),
      ]),
    );
  }
}
