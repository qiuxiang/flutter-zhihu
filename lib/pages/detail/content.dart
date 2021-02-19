import 'package:flutter/material.dart';

import '../../types.dart';
import '../../widgets/html.dart';

class Content extends StatelessWidget {
  final RecommendDatum item;
  const Content(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Html(item.target.content),
    );
  }
}
