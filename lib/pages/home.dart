import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;

import '../api.dart';
import '../types.dart' show Datum, TargetType, Target, DatumType;
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
    if (item.type == DatumType.FEED_ADVERT) return const SizedBox();

    String title;
    Widget content = const SizedBox();
    Widget thumbnail = const SizedBox();

    switch (item.target.type) {
      case TargetType.ANSWER:
        title = item.target.question.title;
        content = Html(item.target.excerptNew);
        break;
      case TargetType.ARTICLE:
        title = item.target.title;
        content = Html(item.target.excerptNew);
        break;
      case TargetType.ZVIDEO:
        title = item.target.title;
        content = Thumbnail(item.target);
    }

    final thumbnailUrl = item.target.thumbnail;
    if (thumbnailUrl != null && thumbnailUrl.isNotEmpty) {
      thumbnail = Container(
        height: 68,
        width: 68,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: CachedNetworkImage(imageUrl: thumbnailUrl, fit: BoxFit.cover),
      );
    }

    return Card(
      margin: const EdgeInsets.only(top: 8),
      shape: const RoundedRectangleBorder(),
      child: InkWell(
        onTap: () => Get.to(DetailPage(item)),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Get.textTheme.bodyText1.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Row(children: [
                Expanded(
                  child: Column(children: [
                    Row(children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          height: 20,
                          imageUrl: item.target.author.avatarUrl,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(item.target.author.name),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          item.target.author.headline,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Get.textTheme.caption.copyWith(fontSize: 14),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 8),
                    content,
                  ]),
                ),
                const SizedBox(width: 8),
                thumbnail
              ]),
              const SizedBox(height: 8),
              DefaultTextStyle(
                style: Get.textTheme.caption,
                child: Row(children: [
                  StatsItem(Icons.thumb_up, item.target.voteupCount ?? 0),
                  StatsItem(Icons.comment, item.target.commentCount),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatsItem extends StatelessWidget {
  final IconData icon;
  final int value;

  const StatsItem(this.icon, this.value, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon, size: 14, color: Get.textTheme.caption.color),
      const SizedBox(width: 4),
      Text('$value'),
      const SizedBox(width: 12),
    ]);
  }
}

class Thumbnail extends StatelessWidget {
  final Target target;
  const Thumbnail(this.target, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final thumbnail = target.thumbnailExtraInfo;
    return Stack(children: [
      Container(
        width: double.infinity,
        height: (Get.width - 32) / 16 * 9,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: CachedNetworkImage(imageUrl: thumbnail.url, fit: BoxFit.cover),
      ),
      const PlayIcon(),
    ]);
  }
}

class Html extends StatelessWidget {
  final String html;

  const Html(this.html, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Get.textTheme.bodyText2;
    style = style.copyWith(color: style.color.withOpacity(0.66));
    return Text(
      parse(html).firstChild.text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: style,
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
