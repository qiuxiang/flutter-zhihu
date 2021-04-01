import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../types.dart' show ChildCommentElement, Target;
import '../../utils.dart';
import '../../widgets/widgets.dart';
import 'child_comments.dart';
import 'comments_state.dart';
import 'group_title.dart';
import 'item.dart';

class Comments extends StatelessWidget {
  final Target target;

  const Comments(this.target, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CommentsState());
    final state = Get.find<CommentsState>();
    if (state.target != target) {
      state.target = target;
      state.init();
    }

    return ModalBottomSheet('全部评论', [
      Obx(() {
        if (state.comments.isEmpty) {
          return SliverFillRemaining(
            child: Container(
              color: Get.theme.cardColor,
              child: const Loading(),
            ),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) {
              if (i == state.comments.length) {
                if (state.end.value) return const SizedBox();

                state.fetch();
                return const SizedBox(height: 64, child: Loading());
              }
              final item = state.comments[i];
              return Column(children: [
                buildWidget(
                  i == 0 && state.comment.featuredCounts > 0,
                  () => GroupTitle(
                    '精选评论（${state.comment.featuredCounts}）',
                  ),
                ),
                buildWidget(i == state.comment.featuredCounts, () {
                  return GroupTitle(
                    '评论（${state.comment.commonCounts}）',
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Item(item),
                ),
                buildChildComments(item),
                // 不显示分割线情况：1、最后一个；2、有精选评论且精选评论的最后一个
                buildWidget(
                  !(i == state.comments.length - 1 ||
                      (state.comment.featuredCounts > 0 &&
                          i == state.comment.featuredCounts - 1)),
                  () => Column(children: [
                    const Divider(height: 0),
                    const SizedBox(height: 12),
                  ]),
                ),
              ]);
            },
            childCount: state.comments.length + 1,
          ),
        );
      })
    ]);
  }

  Widget buildChildComments(ChildCommentElement item) {
    if (item.childComments.isEmpty) return const SizedBox();

    const avatarSize = 20.0;
    const indent = avatarSize + 8;
    return Padding(
      padding: const EdgeInsets.only(left: 16 + 36 + 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Divider(height: 0),
        const SizedBox(height: 12),
        ...item.childComments.map((i) {
          return Column(children: [
            Item(i, avatarSize: avatarSize),
            buildWidget(
              item.childComments.last != i,
              () => Column(children: [
                const Divider(height: 0, indent: indent),
                const SizedBox(height: 12),
              ]),
            ),
          ]);
        }),
        buildWidget(item.childCommentCount > item.childComments.length, () {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(height: 0, indent: indent),
              CupertinoButton(
                padding: const EdgeInsets.only(left: indent),
                onPressed: () => Get.bottomSheet(
                  ChildComments(item),
                  isScrollControlled: true,
                ),
                child: Text(
                  '查看全部 ${item.childCommentCount} 条回复',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          );
        }),
      ]),
    );
  }
}
