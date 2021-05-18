import 'package:flutter/material.dart';
import 'package:get/get.dart';

export 'avatar.dart';
export 'html.dart';
export 'html_text.dart';
export 'loading.dart';
export 'modal_bottom_sheet.dart';
export 'play_icon.dart';
export 'scaffold_page.dart';

class Right extends StatelessWidget {
  final Widget child;

  const Right(this.child);

  @override
  Widget build(BuildContext context) {
    return Align(child: child, alignment: Alignment.centerRight);
  }
}

class Left extends StatelessWidget {
  final Widget child;

  const Left(this.child);

  @override
  Widget build(BuildContext context) {
    return Align(child: child, alignment: Alignment.centerLeft);
  }
}

abstract class GetxWidget<T> extends StatelessWidget {
  const GetxWidget({Key? key}) : super(key: key);

  final String? tag = null;

  T get state => Get.find<T>(tag: tag);
}
