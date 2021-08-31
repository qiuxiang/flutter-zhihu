import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';
import '../detail/detail.dart';
import 'state.dart';
import 'stats_item.dart';
import 'thumbnail.dart';

class RecommendsPage extends StatefulWidget {
  const RecommendsPage();

  @override
  _RecommendsPageState createState() => _RecommendsPageState();
}

class _RecommendsPageState extends State<RecommendsPage> {
  final state = HomeState();

  @override
  void initState() {
    super.initState();
    Get.put(state);
    state.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(
        toolbarHeight: 0,
        shadowColor: Colors.transparent,
        backwardsCompatibility: false,
      ),
      slivers: [
        Obx(() {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) {
                if (i == state.items.length) {
                  state.fetch();
                  return const SizedBox(height: 64, child: Loading());
                }
                return Item(state.items[i]);
              },
              childCount: state.items.length + 1,
            ),
          );
        }),
      ],
    );
  }
}

class Item extends StatelessWidget {
  final Map item;

  const Item(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item['type'] == 'feed_advert') return const SizedBox();

    String title;
    Widget content = const SizedBox();
    Widget thumbnail = const SizedBox();
    Map target = item['target']!;

    switch (target['type']) {
      case 'answer':
        title = target['question']['title'];
        content = HtmlText(target['excerpt_new'], maxLines: 2);
        break;
      case 'article':
        title = target['title'];
        content = HtmlText(target['excerpt_new'], maxLines: 2);
        break;
      case 'zvideo':
        title = target['title'];
        content = Thumbnail(target);
        break;
      default:
        return const SizedBox();
    }

    final thumbnailUrl = target['thumbnail'];
    if (thumbnailUrl != null && thumbnailUrl.isNotEmpty) {
      thumbnail = Container(
        height: 68,
        width: 68,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: CachedNetworkImage(imageUrl: thumbnailUrl, fit: BoxFit.cover),
      );
    }

    return Card(
      margin: const EdgeInsets.only(top: 8),
      shape: const RoundedRectangleBorder(),
      child: InkWell(
        onTap: () => Get.to(DetailPage(target)),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.bodyText1?.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Row(children: [
                Expanded(
                  child: Column(children: [
                    Row(children: [
                      Avatar(target['author']['avatar_url'], 20),
                      const SizedBox(width: 4),
                      Text(target['author']['name']),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          target['author']['headline'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              context.textTheme.caption?.copyWith(fontSize: 14),
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
                style: context.textTheme.caption!,
                child: Row(children: [
                  StatsItem(
                    Icons.thumb_up,
                    target['voteup_count'] ?? target['vote_count'],
                  ),
                  StatsItem(Icons.comment, target['comment_count']),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
