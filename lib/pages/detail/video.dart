import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final Map target;

  const Video(this.target, {Key? key}) : super(key: key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController player;
  late ChewieController chewie;

  @override
  void initState() {
    super.initState();
    Map video = widget.target['thumbnail_extra_info']['playlist']['hd'];
    player = VideoPlayerController.network(video['url']);
    chewie = ChewieController(
      videoPlayerController: player,
      autoInitialize: true,
      autoPlay: true,
      showControls: true,
      showControlsOnInitialize: false,
      aspectRatio: video['width'] / video['height'],
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
    Map video = widget.target['thumbnail_extra_info']['playlist']['hd'];
    return SizedBox(
      height: Get.width / video['width'] * video['height'],
      child: Chewie(controller: chewie),
    );
  }
}
