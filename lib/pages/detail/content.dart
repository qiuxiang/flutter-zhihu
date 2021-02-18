import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../types.dart';

class Content extends StatelessWidget {
  final RecommendDatum item;
  const Content(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: HtmlWidget(item.target.content, onTapUrl: launch),
    );
  }
}
