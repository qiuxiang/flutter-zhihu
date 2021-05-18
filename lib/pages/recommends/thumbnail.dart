import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';

class Thumbnail extends StatelessWidget {
  final Map target;

  const Thumbnail(this.target, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url = target['thumbnail_extra_info']['url'];
    return Stack(children: [
      Container(
        width: double.infinity,
        height: (Get.width - 32) / 16 * 9,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Visibility(
          visible: url != null,
          child: CachedNetworkImage(imageUrl: url, fit: BoxFit.cover),
        ),
      ),
      const PlayIcon(),
    ]);
  }
}
