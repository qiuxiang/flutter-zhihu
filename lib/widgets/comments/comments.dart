import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../types.dart' show Target;
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
                      return Column(children: [
                        Item(state.comments[i]),
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
}
