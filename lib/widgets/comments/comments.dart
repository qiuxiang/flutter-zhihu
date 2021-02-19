import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../types.dart' show ChildCommentElement, Target;
import '../../utils.dart';
import '../widgets.dart';
import 'item.dart';
import 'state.dart';

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

    return NestedScrollView(
      headerSliverBuilder: (_, __) => const [
        SliverPadding(padding: EdgeInsets.all(12)),
      ],
      body: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 0,
        builder: (_, controller) {
          return Container(
            color: Get.theme.cardColor,
            child: CustomScrollView(controller: controller, slivers: [
              SliverAppBar(
                title: const Text('全部评论'),
                pinned: true,
                backwardsCompatibility: false,
                leading: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: Get.back,
                ),
              ),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Item(item),
                        ),
                        buildChildComments(item),
                        const Divider(height: 0),
                        const SizedBox(height: 12),
                      ]);
                    },
                    childCount: state.comments.length + 1,
                  ),
                );
              }),
            ]),
          );
        },
      ),
    );
  }

  Widget buildChildComments(ChildCommentElement item) {
    if (item.childComments.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.only(left: 60),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Divider(height: 0),
        const SizedBox(height: 12),
        ...item.childComments.map((i) {
          return Column(children: [
            Item(i, avatarSize: 20),
            buildWidget(
              item.childComments.last != i,
              () => Column(children: [
                const Divider(height: 0, indent: 28),
                const SizedBox(height: 12),
              ]),
            ),
          ]);
        }),
        buildWidget(item.childCommentCount > item.childComments.length, () {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(height: 0, indent: 28),
              CupertinoButton(
                padding: const EdgeInsets.only(left: 28),
                onPressed: () {},
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
