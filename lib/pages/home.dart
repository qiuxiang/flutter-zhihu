import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api.dart';
import '../types.dart' show Datum, TargetType;
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeState());
    final state = Get.find<HomeState>();
    state.fetch();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backwardsCompatibility: false,
        backgroundColor: Get.theme.cardColor,
        shadowColor: Colors.transparent,
      ),
      body: RefreshIndicator(
        onRefresh: () => state.fetch(refresh: true),
        child: CustomScrollView(slivers: [
          Obx(() {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) {
                  if (i == state.items.length) {
                    state.fetch();
                    return const SizedBox(height: 64, child: Loading());
                  }
                  return buildItem(state.items[i]);
                },
                childCount: state.items.length + 1,
              ),
            );
          }),
        ]),
      ),
    );
  }

  Widget buildItem(Datum item) {
    String title;
    Widget content = const SizedBox();

    switch (item.target.type) {
      case TargetType.ANSWER:
        title = item.target.question.title;
        content = Text(item.target.excerptNew, style: Get.textTheme.bodyText2);
        break;
      case TargetType.ARTICLE:
        title = item.target.title;
        content = Text(item.target.excerptNew, style: Get.textTheme.bodyText2);
        break;
      case TargetType.ZVIDEO:
        title = item.target.title;
        final thumbnail = item.target.thumbnailExtraInfo;
        print(thumbnail.url);
        content = Container(
          decoration: BoxDecoration(
            color: Get.theme.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          height: (Get.width - 32) / thumbnail.width * thumbnail.height,
          child: CachedNetworkImage(
            imageUrl: item.target.thumbnailExtraInfo.url,
          ),
        );
    }

    return FlatButton(
      padding: const EdgeInsets.all(16),
      onPressed: () {},
      child: SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: Get.textTheme.bodyText1.copyWith(fontSize: 16)),
          const SizedBox(height: 12),
          content,
        ]),
      ),
    );
  }
}

class HomeState extends GetxController {
  String next;
  final items = <Datum>[].obs;
  bool loading = false;

  Future fetch({bool refresh = false}) async {
    if (loading) return;

    loading = true;
    final recommend = await getRecommend(refresh ? null : next);
    loading = false;
    if (refresh) {
      items.assignAll(recommend.data);
    } else {
      items.addAll(recommend.data);
    }
    next = recommend.paging.next;
  }
}
