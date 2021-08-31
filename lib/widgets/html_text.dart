import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;

class HtmlText extends StatelessWidget {
  final int? maxLines;
  final String? html;

  const HtmlText(this.html, {Key? key, this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      parse(html ?? '').firstChild?.text ?? '',
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: context.textTheme.bodyText2,
    );
  }
}
