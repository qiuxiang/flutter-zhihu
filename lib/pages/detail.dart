import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

import '../types.dart' show Datum, TargetType;

class DetailPage extends StatelessWidget {
  final Datum item;

  const DetailPage(this.item);

  @override
  Widget build(BuildContext context) {
    String title;
    final children = <Widget>[];

    switch (item.target.type) {
      case TargetType.ANSWER:
        title = item.target.question.title;
        children.addAll([Content(item)]);
        break;
      case TargetType.ARTICLE:
        title = item.target.title;
        children.addAll([Content(item)]);
        break;
      case TargetType.ZVIDEO:
        children.addAll([Video(item)]);
        title = item.target.title;
    }
    return Scaffold(
      backgroundColor: Get.theme.cardColor,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text(title),
          pinned: true,
          backwardsCompatibility: false,
        ),
        SliverList(delegate: SliverChildListDelegate([...children])),
      ]),
    );
  }
}

class Content extends StatelessWidget {
  final Datum item;
  const Content(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: HtmlWidget(item.target.content, onTapUrl: launch),
    );
  }
}

class Video extends StatefulWidget {
  final Datum item;
  const Video(this.item, {Key key}) : super(key: key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController player;
  ChewieController chewie;

  @override
  void initState() {
    super.initState();
    final video = widget.item.target.thumbnailExtraInfo.playlist.hd;
    final ratio = video.width / video.height;
    player = VideoPlayerController.network(video.url);
    chewie = ChewieController(
      videoPlayerController: player,
      autoInitialize: true,
      autoPlay: true,
      showControls: true,
      showControlsOnInitialize: false,
      aspectRatio: ratio,
    );
  }

  @override
  void dispose() {
    player.dispose();
    chewie.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final video = widget.item.target.thumbnailExtraInfo.playlist.hd;
    return SizedBox(
      height: Get.width / video.width * video.height,
      child: Chewie(controller: chewie),
    );
  }
}
