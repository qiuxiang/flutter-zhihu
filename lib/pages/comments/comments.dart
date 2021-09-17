import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';
import 'child_comments.dart';
import 'comments_state.dart';
import 'group_title.dart';
import 'item.dart';

class Comments extends StatefulWidget {
  final Map target;

  const Comments(this.target, {Key? key}) : super(key: key);

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final state = CommentsState();

  @override
  void initState() {
    super.initState();
    Get.put(state);
    if (state.target != widget.target) {
      state.target = widget.target;
      state.init();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheet('全部评论', [
      Obx(() {
        if (state.comments.isEmpty) {
          return SliverFillRemaining(
            child: Material(
              color: context.theme.cardColor,
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
              final featuredCount = state.comment['featured_counts'];
              return Column(children: [
                if (i == 0 && featuredCount! > 0)
                  GroupTitle('精选评论（$featuredCount）'),
                if (i == featuredCount)
                  GroupTitle('评论（${state.comment['common_counts']}）'),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Item(item),
                ),
                buildChildComments(item),
                // 不显示分割线情况：1、最后一个；2、有精选评论且精选评论的最后一个
                if (!(i == state.comments.length - 1 ||
                    (featuredCount > 0 && i == featuredCount - 1)))
                  Column(children: const [
                    Divider(height: 0),
                    SizedBox(height: 12),
                  ]),
              ]);
            },
            childCount: state.comments.length + 1,
          ),
        );
      })
    ]);
  }

  Widget buildChildComments(Map item) {
    final comments = item['child_comments'];
    if (comments?.isEmpty ?? true) return const SizedBox();

    const avatarSize = 20.0;
    const indent = avatarSize + 8;
    return Padding(
      padding: const EdgeInsets.only(left: 16 + 36 + 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Divider(height: 0),
        const SizedBox(height: 12),
        ...comments.map((i) {
          return Column(children: [
            Item(i, avatarSize: avatarSize),
            if (comments.last != i)
              Column(children: [
                const Divider(height: 0, indent: indent),
                const SizedBox(height: 12),
              ]),
          ]);
        }),
        if (item['child_comment_count'] > comments.length)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(height: 0, indent: indent),
              CupertinoButton(
                padding: const EdgeInsets.only(left: indent),
                onPressed: () => Get.bottomSheet(
                  ChildComments('全部回复', item),
                  isScrollControlled: true,
                ),
                child: Text(
                  '查看全部 ${item['child_comment_count']} 条回复',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
      ]),
    );
  }
}
