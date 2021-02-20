import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

import '../../types.dart' show RecommendDatum, FluffyType, ResourceTypeEnum;
import '../../widgets/widgets.dart';
import '../detail/detail.dart';
import 'state.dart';
import 'stats_item.dart';
import 'thumbnail.dart';

class RecommendPage extends StatelessWidget {
  const RecommendPage();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeState());
    final state = Get.find<HomeState>();
    state.fetch();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        shadowColor: Colors.transparent,
        backwardsCompatibility: false,
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

  Widget buildItem(RecommendDatum item) {
    if (item.type == FluffyType.FEED_ADVERT) return const SizedBox();

    String title;
    Widget content = const SizedBox();
    Widget thumbnail = const SizedBox();

    switch (item.target.type) {
      case ResourceTypeEnum.ANSWER:
        title = item.target.question.title;
        content = HtmlText(item.target.excerptNew, maxLines: 2);
        break;
      case ResourceTypeEnum.ARTICLE:
        title = item.target.title;
        content = HtmlText(item.target.excerptNew, maxLines: 2);
        break;
      case ResourceTypeEnum.ZVIDEO:
        title = item.target.title;
        content = Thumbnail(item.target);
        break;
      default:
        return const SizedBox();
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
        onTap: () => Get.to(DetailPage(item.target)),
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
                      Container(
                        width: 20,
                        height: 20,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Get.theme.scaffoldBackgroundColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: CachedNetworkImage(
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
                  StatsItem(
                    Icons.thumb_up,
                    item.target.voteupCount ?? item.target.voteCount,
                  ),
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
