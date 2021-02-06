import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';

import '../api.dart';
import '../types.dart' show Datum, TargetType;
import '../widgets/widgets.dart';
import 'detail.dart';

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
        content = HTML(item.target.excerptNew);
        break;
      case TargetType.ARTICLE:
        title = item.target.title;
        content = HTML(item.target.excerptNew);
        break;
      case TargetType.ZVIDEO:
        title = item.target.title;
        final thumbnail = item.target.thumbnailExtraInfo;
        content = Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          clipBehavior: Clip.hardEdge,
          height: (Get.width - 32) / thumbnail.width * thumbnail.height,
          child: CachedNetworkImage(
            imageUrl: item.target.thumbnailExtraInfo.url,
            placeholder: (_, __) =>
                Container(color: Get.theme.scaffoldBackgroundColor),
          ),
        );
    }

    return FlatButton(
      color: Get.theme.cardColor,
      padding: const EdgeInsets.all(16),
      onPressed: () => Get.to(DetailPage(item)),
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

class HTML extends StatelessWidget {
  final String html;
  const HTML(this.html, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(data: html, style: {
      'body': Style(
        margin: EdgeInsets.zero,
        color: Get.textTheme.bodyText2.color.withOpacity(0.66),
      ),
    });
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
