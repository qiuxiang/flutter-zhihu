import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../types.dart' show Datum, TargetType;

class DetailPage extends StatelessWidget {
  final Datum item;

  const DetailPage(this.item);

  @override
  Widget build(BuildContext context) {
    String title;
    switch (item.target.type) {
      case TargetType.ANSWER:
        title = item.target.question.title;
        break;
      case TargetType.ARTICLE:
      case TargetType.ZVIDEO:
        title = item.target.title;
    }
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text(title),
          pinned: true,
          backwardsCompatibility: false,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(8),
              child: Html(data: item.target.content),
            ),
          ]),
        ),
      ]),
    );
  }
}
