import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../types.dart';

class Video extends StatefulWidget {
  final RecommendDatum item;
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
