import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Html extends StatelessWidget {
  final String html;

  const Html(this.html, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      html.replaceAll(RegExp(r'</?noscript>'), ''),
      hyperlinkColor: Get.textTheme.bodyText2?.color,
      onTapUrl: launch,
      customWidgetBuilder: (item) {
        switch (item.localName) {
          case 'hr':
            return const Divider();
        }
        if (item.className == 'origin_image zh-lightbox-thumb lazy') {
          return const SizedBox();
        }
        return null;
      },
      customStylesBuilder: (item) {
        switch (item.localName) {
          case 'pre':
            return {
              'font-family': 'DroidSansMono',
              'padding': '12px',
              'background': Get.theme.scaffoldBackgroundColor.toRgbaString(),
            };
        }
        return null;
      },
    );
  }
}

extension ToString on Color {
  String toRgbaString() {
    return 'rgba($red,$green,$blue,${alpha / 255})';
  }
}
