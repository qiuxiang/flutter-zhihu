import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Avatar extends StatelessWidget {
  final double size;
  final String? url;

  const Avatar(this.url, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Get.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(size)),
      ),
      child: CachedNetworkImage(imageUrl: url ?? ''),
    );
  }
}
